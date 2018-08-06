### オプション ###

# ディレクトリ名でcdする
setopt autocd

# cdした先のディレクトリをディレクトリスタックに追加する
# 例：`cd+<Tab>`
setopt autopushd

# pushdしたとき、ディレクトリがスタックにある場合追加しない
setopt pushdignoredups

# 入力したコマンドが履歴に含まれる場合、古い履歴から削除
setopt histignorealldups

# 重複した履歴を表示しない
setopt histignoredups

# コマンドがスペースで始まる場合、履歴へ追加しない
setopt histignorespace

# リスト表示のときにはじめから挿入する
setopt menucomplete

# ファイル生成パターンのエラーを表示しない
setopt nomatch

# ヒストリファイルをセッションごとに上書きする
setopt appendhistory 

# タイポを修正
setopt correct

# 候補の表示をコンパクトにする
setopt listpacked

# オプションの=の後の補完をする
setopt magicequalsubst

# 履歴を共有する
setopt share_history

# コマンド実行時に右プロンプトを削除する
setopt transient_rprompt

# 余分な空白は詰めて記録
setopt histreduceblanks

# 拡張globを無効
unsetopt extendedglob

# エラー時にビープを鳴らさない
unsetopt beep

# 出力されなかった行を非通知
unsetopt promptsp

# バックグラウンドjobが終了しても通知しない
unsetopt notify

