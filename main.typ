#import "style/template.typ": template
#show: template

= 目的
本文。

字下げテスト。

= 基礎知識
== 見出しテスト
=== 見出しテスト
数式のテスト@eq:test 。
$
    e ^ (i theta) = cos theta + i sin theta
$<eq:test>

= 方法
表のテスト@table:test 。
#figure(
    table(columns: 2)[t][e][s][t],
    caption: [表のキャプションのテスト]
)<table:test>

= 結果
図のテスト@image:test 。
#figure(
    rect[test],
    caption: [図のキャプションのテスト]
)<image:test>

= 考察

= 参考文献
