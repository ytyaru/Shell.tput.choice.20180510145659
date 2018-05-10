# 二バイト文字

https://rcmdnk.com/blog/2013/11/18/computer-mac-windows/

罫線などの2バイト文字を表示しようとすると隣の文字に重なってしまい潰れることがある。これを改善したい。が、調べてみると特定のターミナルソフトでないと対応できないっぽい。

## 環境

* Raspbian 8.0
* LXTerminal 0.2.0

## Vim

ターミナルで２バイト文字に対応させた上で、Vimには以下の設定が必要。

```vimscript
set ambiwidth=double
```

