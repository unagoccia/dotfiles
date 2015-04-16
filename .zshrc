Last login: Thu Apr 16 14:36:42 on ttys001
hase-tt@mrs.private:~$ ls                                            [14:38:29]
Applications  Documents  Library  Music     Public  svn
Desktop       Downloads  Movies   Pictures  github  tmp
hase-tt@mrs.private:~$ vi .zshrc                                                                                                                    [14:38:40]





































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
        #%n     ユーザー名
        #%M     コンピュータ名
        #%c     カレントディレクトリ
#通常
PROMPT="[%n@%M]$ "
#複数行
PROMPT2="%_$ "
#確認
SPROMPT="%r is correct? [n,y,a,e]: "
#右プロンプト
        #%*     時間
#RPROMPT=$DEFAULT"[%*]"
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
