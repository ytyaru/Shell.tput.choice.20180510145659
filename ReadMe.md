# このソフトウェアについて

Bashで選択肢を表示しカーソル移動し選択する。

# 使い方

```bash
. choice.sh
Choice "はい" "いいえ"
```

## 実行画面

```sh
> はい
  いいえ
```

* 矢印キーの上(`↑`)と下(`↓`)でカーソル移動
* `Enter`, `Space`のいずれかで決定

### 結果の取得

選択した項目のインデックス値を返す。(0..255)

```bash
. choice.sh
Choice "はい" "いいえ"
res=$?
[ $? -eq 0 ] && echo YES
[ $? -eq 1 ] && echo NO
```

# 既知のバグ

* 矢印キー`↑`,`↓`,`→`,`←`をデタラメに同時押しすると画面が壊れる
    * 原因不明。`read -s`でサイレントにできていない？

# 開発環境

* [Raspberry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 3 Model B
    * [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) GNU/Linux 8.0 (jessie)
        * bash 4.3.30

# ライセンス

このソフトウェアはCC0ライセンスである。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)
