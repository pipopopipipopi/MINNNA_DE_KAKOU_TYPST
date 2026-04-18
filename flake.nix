{
  description = "A Typst project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, typix, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { system, pkgs, ... }: let
        typixLib = typix.lib.${system};

        src = typixLib.cleanTypstSource ./.;

        commonArgs = {
          typstSource = "main.typ";

          fontPaths = [
            "${pkgs.noto-fonts-cjk-serif-static}/share/fonts/opentype"
            "${pkgs.noto-fonts-cjk-sans-static}/share/fonts/opentype"
          ];

          virtualPaths = [
            # {
            #   dest = "icons";
            #   src = "${inputs.font-awesome}/svgs/regular";
            # }
          ];
        };

        build-drv = typixLib.buildTypstProject (commonArgs // {
          inherit src;
        });

        build-script = typixLib.buildTypstProjectLocal (commonArgs // {
          inherit src;
        });

        watch-script = typixLib.watchTypstProject commonArgs;

      in {
        checks = {
          inherit build-drv build-script watch-script;
        };

        packages.default = build-drv;

        apps = {
          default = {
            type = "app";
            program = "${watch-script}/bin/typst-watch";
          };

          build = {
            type = "app";
            program = "${build-script}/bin/typst-build";
          };

          watch = {
            type = "app";
            program = "${watch-script}/bin/typst-watch";
          };
        };

        devShells.default = typixLib.devShell {
          inherit (commonArgs) fontPaths virtualPaths;
          packages = [
            watch-script
          ];
        };
      };
    };
}
