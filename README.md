##### 背景
度々物議をかもすExcelのセル結合やセル改行。
何度お願いだからセルのマージだけはやめてと言っても辞めてくれないのが人間の性。
セル結合の解除や改行セルの分割といった雑用が他の有意義な仕事を阻害していくのです。。。

##### 解決方法
そこで今回はセル改行に焦点を当てて、セル改行されているcsvファイルをセル分割するツールを作りました。
（今後なんとかしてセル結合問題も解いていきたいが、仕様決めが結構難しい。。）
![image](https://user-images.githubusercontent.com/55495694/94996092-6ed07a80-05dd-11eb-8d53-15275f88125b.png)



使い勝手はこんな感じです。
1. セル改行されているcsvを読み込む
1. inputタブで読み込まれたファイル確認
1. outputタブで改行が分割されたデータを確認
1. データ出力



##### 使い方
普段Ｒを使わない方はちょっとだけ前準備が必要です。
1. Rstudioをインストール
1. 下記おまじないをRstudioのコンソールに打ち込んで、ライブラリをインストール
```
install.packages("shiny")
install.packages("DT")
install.packages("tidyverse")
```
1. 下記おまじないをRstudioのコンソールに打ち込んで、ツールの実行
```
library(shiny)  
runUrl("https://github.com/Ry87/SeparateCellsApp/archive/master.tar.gz")
```
