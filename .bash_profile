[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

## rbenv
#
if [[ -s /opt/boxen/rbenv/bin ]] ; then
    rbenv global 2.0.0-p247
    rbenv version | sed -e 's/ .*//'
fi

## nodenv
#
if [[ -s /opt/boxen/nodenv/bin ]] ; then
    nodenv global v0.10
    nodenv version | sed -e 's/ .*//'
fi

# bashrc
#文字コード関連<
export LC_CTYPE=C
export LANG=ja_JP.UTF-8
export LC_ALL=C
export LC_MESSAGES='ja_JP.UTF-8'

# alias
alias scn='screen -t'
alias scnu='screen -tU'
alias scls='screen -ls'
alias scr='screen -rU'
alias ll='ls -liahG'

# ls color
export LS_COLORS='no=00:fi=00:di=00;36:ln=00;30:pi=40;33:so=00;35:bd=40;33;00:cd=40;33;00:ex=00;35:*~=05;31:*.mtxt=05;31:*.ndx=05;31:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.c=00;33:*.h=00;33:*.pl=00;33:*.pm=00;33:*.cgi=00;33:*.java=00;33:*.html=00;33:*.sh=00;33:*.txt=00;35:*.tar=00;31:*.tgz=00;31:*.gz=00;31:*.tgz=00;31:*.bz2=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.jpg=00;35:*.jpeg=00;35:*.JPG=00;35:*.gif=00;35:*.GIF=00;35:*.bmp=00;35:*.BMP=00;35:*.xbm=00;35:*.ppm=00;35:*.xpm=00;35:*.tif=00;35:';
export LSCOLORS=gxfxcxdxbxegedabagacad

# status bar
export ESC="$(echo -en '\033')"
export COLOUR_RED="$(echo -en '\033[31m')"
export COLOUR_GREEN="$(echo -en '\033[32m')"
export COLOUR_YELLOW="$(echo -en '\033[33m')"
export COLOUR_BLUE="$(echo -en '\033[34m')"
export COLOUR_CYAN="$(echo -en '\033[35m')"
export COLOUR_MAGENTA="$(echo -en '\033[36m')"
export COLOUR_WHITE="$(echo -en '\033[37m')"
export COLOUR_HIGHLIGHT_RED="$(echo -en '\033[31;1m')"
export COLOUR_HIGHLIGHT_GREEN="$(echo -en '\033[32;1m')"
export COLOUR_HIGHLIGHT_YELLOW="$(echo -en '\033[33;1m')"
export COLOUR_HIGHLIGHT_BLUE="$(echo -en '\033[34;1m')"
export COLOUR_HIGHLIGHT_CYAN="$(echo -en '\033[35;1m')"
export COLOUR_HIGHLIGHT_MAGENTA="$(echo -en '\033[36;1m')"
export COLOUR_HIGHLIGHT_WHITE="$(echo -en '\033[37;1m')"
export COLOUR_DEFAULT="$(echo -en '\033[m')"

GIT_PS1_SHOWDIRTYSTATE=true

PS_USER="\[\e[33m\]\u\[\e[0m\]"
PS_HOST="\[\e[32m\]\h\[\e[0m\]"
PS_WORK="\[\e[37;1m\]\W\[\e[0m\]"
PS_SCREEN=""
PS_SSH=""

if [ -n "${PARTTY_SESSION}" ] ; then
    PS_HOST="\[\e[32m\]${PARTTY_SESSION}!\[\e[0m\]"
fi
if [ -n "${WINDOW}" ] ; then
    PS_SCREEN="(\[\e[35m\]${WINDOW}\[\e[0m\])"
fi
if [ -n "${SSH_CLIENT}" ] ; then
    PS_SSH="(\[\e[36m\]`echo ${SSH_CLIENT} | sed 's/ [0-9]\+ [0-9]\+$//g'`\[\e[0m\])"
fi
if [ -f ~/.atode ]; then
    PS_ATODE="(\`cat ~/.atode | wc -l\`)"
fi
export PS1="[${PS_USER}${PS_SCREEN}@${PS_HOST}${PS_SSH}${PS_ATODE} ${PS_WORK}]\$ "



export EDITOR="vim"
