#変更後はコンパイル
#$ zcompile ~/.zshrc
#設定
#$ source ~/.zshrc

#dircolorsを利用するためにインストール
#brew install coreutils
#PATH設定(.zshenv)
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH" 

#setenv () {export $1="$@[2,-1]"}

#日本語utf-8
export LANG=ja_JP.UTF-8

#出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

#ビープ音を鳴らさないようにする
setopt no_beep

###########
## alias ##
###########

#alias java="csh -c java"
#alias javac="csh -c javac"

#lsの設定
alias ls="ls --color=auto"	        #色つき
alias la="ls -a"			#隠しファイルも
alias lf="ls -F"			#ディレクトリには/を
alias ll="ls -l"			#詳細付き

#sudo用gedit
alias suedit="sudo XMODIFIERS=@im=ibus GTK_IM_MODULE=xim gedit"

#grep
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

#拡張子で自動化
alias -s zip=zipinfo
alias -s java=gedit
alias -s c=gedit
alias -s h=gedit
alias -s C=gedit
alias -s cpp=gedit
alias -s txt=gedit
alias -s xml=gedit
alias -s html=firefox
alias -s xhtml=firefox

#上
alias .../=../../
alias ..../=../../../
alias ...../=../../../../
alias ....../=../../../../../
alias ......./=../../../../../../

#stdoutをクリップボードへ
alias -g toclip=" | xsel -bi"
#stdout+stderrをクリップボードへ
alias -g toclipall=" 2>&1 | xsel -bi"
#stdoutをクリップボードとstdoutへ
alias -g andclip=" | (cat 1>&2 | xsel -bi) 2>&1"
#stdout+stderrをクリップボードとstdoutへ
alias -g andclipall=" 2>&1 | (cat 1>&2 | xsel -bi) 2>&1"

#############
## 補完関係 ##
#############

#コマンドラインオプションも補完
autoload -U compinit
compinit

#補完関数をできるだけ過剰に
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# 補完の時に大文字小文字を区別しない(但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#矢印キー補完選択
zstyle ':completion:*:default' menu select

#先方予測・学習機能
#autoload predict-on
#predict-on

#自動cd(cdなしでおｋ
setopt auto_cd

#コマンド修正提示
setopt correct		#通常
#setopt correct_all	#ファイル名まで考慮

#補完候補が複数ある時に、一覧表示する
setopt auto_list

#タブキー連打で補完候補を順に表示
setopt auto_menu

# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete  

# 補完候補が複数ある時、一覧表示 (auto_list) せず、すぐに最初の候補を補完する
setopt menu_complete

#補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types

#'='以降でも補完できるようにする( --prefix=/usr 等の場合)
setopt magic_equal_subst

#補完される前にオリジナルのコマンドまで展開してチェックする
setopt complete_aliases

## カッコの対応などを自動的に補完
setopt auto_param_keys

#補完候補をできるだけ詰めて表示する
setopt list_packed

##############
## 履歴関係 ##
##############

#履歴の保存先
HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000

#直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

#全履歴の一覧を出力する
function history-all { history -E 1 }

#移動履歴をプッシュ(cd -[Tab]
setopt auto_pushd

#移動履歴をキューではなくスタックで番号付け(最近居た場所が上になる)
setopt pushd_minus

#移動履歴の重複禁止
setopt PUSHD_IGNORE_DUPS

#他のシェルのヒストリをリアルタイムで共有する
setopt share_history

# 余分なスペースを削除してヒストリに保存する
setopt hist_reduce_blanks

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

####################
## その他入力関係 ##
####################

#Ctrl-dでログアウトしない
#setopt ignore_eof

############
## 色関係 ##
############

#補完候補にもlsと同じ色付き表示
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}
#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

##########
## 表示 ##
##########

#プロンプト
	#%n	ユーザー名
	#%M	コンピュータ名
	#%c	カレントディレクトリ
#通常
PROMPT="%n@%M:%c$ "
#複数行
PROMPT2="%_$ "
#確認
SPROMPT="%r is correct? [n,y,a,e]: " 
#右プロンプト
	#%*	時間
RPROMPT=$DEFAULT"[%*]"
#複数行右プロンプト
#RPROMPT2

#タイトル
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

