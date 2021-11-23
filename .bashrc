# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. ~/scripts/bash-zenburn.sh

# Bash History
shopt -s histappend
export EDITOR=vim
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
shopt -s cmdhist

function EXT_COLOR () { echo -ne "\e[38;5;$1m"; }
function CLOSE_COLOR () { echo -ne '\e[m'; }

#export PATH="~/neovim/bin:$PATH"
#export PATH="$PATH:~/bin:~/bin/bin"

#[ -f /usr/rift/scripts/git/bash_git_macros ] && . /usr/rift/scripts/git/bash_git_macros

source ~/.bash_alias

#export PATH=${PATH//\/usr\/local\/git-submodule-tools:/}
#export PATH=./git/rift-submodule-tools:$PATH:/usr/rift/bin

# SSH into a vm by passing the argument for the vm number to this function
#function vm()
#{
#  num=$1
#  ssh grunt2 "ssh 10.0.2.$num"
#}
#
#function rr()
#{
#  cdtop
#  export RIFT_ROOT_SAVE_OLDPWD="${OLDPWD}"
#  ./rift-shell
#}
#export TERM="screen-256color"

my_rift_prompt() {
  prompt="[\[`EXT_COLOR 187`\]\u@\h(${DOCKER_NAME:-})\[`CLOSE_COLOR`\]\[`EXT_COLOR 174`\]][\w]\[`CLOSE_COLOR`\]# "
  if type -t __rw_workspace_tag >/dev/null; then
    PS1="$(__rw_workspace_tag) $prompt "
  else
    PS1="$prompt "
  fi
}

PROMPT_COMMAND=my_rift_prompt
#export PROMPT_COMMAND="history -a;history -c;history -r"
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
#export PATH=/net/strange/localdisk/acormier/3-11-xpullnomerge/git/rift-submodule-tools:$PATH
#export PYTHONSTARTUP=~/.pythonrc.py
#export VIMRUNTIME="/net/boson/home1/acormier/neovim/share/nvim/runtime"
#export VIMRUNTIME=""

#alias debug_lp='LD_PRELOAD="/usr/lib64/libreadline.so.6" ./launchpad.py -c --mock-cli'
#function debug_utest(){
#   LD_PRELOAD="/usr/lib64/libreadline.so.6" python3 "$@" -v -n
#}

#export DEBEMAIL="austin.cormier@riftio.com"
#export DEBFULLNAME="Austin Cormier"

#export LC_ALL="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"
#
if [ -f $HOME/bin/git-completion.bash ]; then
   source $HOME/bin/git-completion.bash
fi
#

#alias pyclean="find . -name \*.pyc -o -name \*.pyo -o -name __pycache__ | xargs -i rm -rf {}"

#export WORKON_HOME=~/Envs
#export WORKON_HOME=~/Envs
#mkdir -p $WORKON_HOME
#source /usr/bin/virtualenvwrapper.sh
#
if [ -f $HOME/bin/git-prompt.sh ]; then
   source $HOME/bin/git-prompt.sh
   PS1=${DOCKER_NAME:+(${DOCKER_NAME})}'[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi
