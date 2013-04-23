# ModifiedDateプラグイン

指定したファイルまたはインデックステンプレートの更新時刻を表示するMTModifiedDate変数タグを追加するプラグイン。

## 更新履歴

 * 0.01 (2007-01-22 18:05:23 +0900):
   * 公開。

## 概要

指定したファイルまたはインデックステンプレートの更新時刻を表示するMTModifiedDate変数タグを追加します。

    <$MTModifiedDate file="ファイル名"$>
    <$MTModifiedDate template="インデックステンプレート名"$>

fileオプションで指定するファイル名は、絶対パスによるファイル名か、Blog Site Pathからの相対パスによるファイル名である必要があります。

MTDate, MTEntryDateなどと共通のオプションが使えます。

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2007, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
