% (C)1992 Institute for New Generation Computer Technology
% (Read COPYRIGHT for detailed information.)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     ICOT FREE SOFTWARE No.82 並列定理証明器 MGTP/N Prolog 版

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

本プログラムは、Prolog で書かれたノングランド版 MGTP の実行処理系である。

ユーザが記述した MGTP 入力節は，Prolog 版では Prolog 節に，KL1 版では 
KL1 節に変換されて、MGTP 推論エンジンに読み込まれる必要があるが、
MGTP/N については、Prolog 版、KL1 版いづれについてもこの変換系はサポート
されていない。
ただし、ノングランド問題のベンチマークとして広く用いられている Condensed 
Detachment 問題については，例題としてファイルが附属しており、ユーザはこれ
らのファイルを用いて、実際に MGTP/N を実行させ、他のシステムとのパフォー
マンス比較等を行なうことができる。

なお、Prolog 版でのこれらの問題に対する実行結果については eval.ps 
を参照されたい。
(ここに含まれるすべての例題が現バージョンで解けるわけではない。)

------------------------------------------------------------------------
Prolog 版操作法

必要ファイル

      mgtp.pl   インタプリタ本体
      mgtpS.pl  インタプリタ本体(ソート機能付)
      unify.pl  出現検査付単一化プログラム
      Prob/pro*.pl   (変換済み)正節と混合節
      Prob/pro*t.pl  (変換済み)棄却節 

コンパイル

$ sicstus
SICStus 2.1 #8: Tue May 11 21:04:52 JST 1993
| ?- compile([mgtp,unify]).     : インタプリタ，単一化プログラムのコンパイル

yes
| ?- 

実行例

| ?- compile(['Prob/pro2.pl','Prob/pro2t']).   : 問題節のコンパイル

yes
| ?- do.     : 証明開始
Succeed      : 証明成功

yes
| ?- 

【注意】引続き問題を解く場合：
内部データベースを init 命令で初期化した後，
新たに問題節をコンパイルする必要がある．

| ?- init.  : 内部データベース初期化

yes
| ?- compile(['Prob/pro5','Prob/pro5t']).        : 問題節を新たにコンパイル

yes
| ?- 


