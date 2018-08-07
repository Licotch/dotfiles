#######-----------------------------------------------
######         _              
#####  _______| |__  _ __ ___ 
####  |_  / __| '_ \| '__/ __|
###  _ / /\__ \ | | | | | (__ 
##  (_)___|___/_| |_|_|  \___|
#-----------------------------------------------------

# 環境変数
export PATH=$PATH:$HOME/tools
export ZDOTDIR=$HOME/.zsh.d

# viキーバインドを有効に
bindkey -v

# 色を有効化
autoload -Uz colors; colors

# deleteキーとbackspaceキーを有効化
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char

# lsを色付きに
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


###---------------------------------------------------
## 補完
#-----------------------------------------------------
# 自動補完を有効
autoload -Uz compinit; compinit

# 小文字大文字混同
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../の後は今いるディレクトリを補完しない
zstyle ':completion*' ignore-parents parent pwd ..

# tabで表示した補完候補をtabで選択
zstyle ':completion:*:default' menu select=1

# 選択中のアイテムをハイライト
zstyle ':completion:*' menu select


###---------------------------------------------------
## 履歴
#-----------------------------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# ctrl+{p, n}で履歴を検索
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward


###---------------------------------------------------
## 外部ファイルを読み込み
#-----------------------------------------------------
source $ZDOTDIR/alias.zsh
source $ZDOTDIR/options.zsh
source $ZDOTDIR/transfer.zsh
source $ZDOTDIR/prompt/prompt.zsh

###---------------------------------------------------
## プラグイン 
#-----------------------------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
