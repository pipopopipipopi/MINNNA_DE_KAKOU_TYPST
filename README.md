# 特別演習1・実験の前半のレポート用のテンプレートよ。

## Nixを使う場合
Nixを使えるようにしましょう。まずは。
([公式よりも良いインストーラー](https://github.com/DeterminateSystems/nix-installer)があるらしい。アンインストールできるらしいから、気に入らなかった時も安心ね。)
そしてflakeを有効にしたら君の勝ちだ。

```shell
git clone https://github.com/pipopopipipopi/MINNNA_DE_KAKOU_TYPST .
```
からの、
```shell
nix run .#build    
```
で`main.typ`がコンパイルされて`main.pdf`が作られるよ。

ちなみに、
```shell
nix run .#watch
```
を実行していると`main.typ`の変更を監視してくれて、ホットリロードしてくれるよ。

## Nixを使わない場合
自分でtypstを使えるよう環境構築するなり、公式のオンラインエディタを使うなり。
`style/template.typ`と`main.typ`の最初の2行をコピペすれば行けるんじゃないかな？フォントでエラー吐かれたら、`style/template.typ`のフォントの設定を自分の環境にあるフォントに変えてね。フォントの設定は2箇所あるから(見出し用と本文用)気をつけて。
