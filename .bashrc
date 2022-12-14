# base-files version 3.7-1

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# source the system wide profile if it exists
if [ -e /etc/profile ] ; then
  source /etc/profile
fi


# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

alias vi='vim'

# Misc :)
# alias less='less -r'                          # raw control characters

# Functions
# #########

# Some example functions

export LS_OPTIONS="-A -N --color=always -T 0"

# lod the colour scheme the painful way ...
#~/.mintty_colours

alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls --color=tty --show-control-chars'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

export SSH_AUTH_SOCK=/tmp/.ssh-socket

ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
   # Exit status 2 means couldn't connect to ssh-agent; start one now
   rm -f /tmp/.ssh-*
   ssh-agent -a $SSH_AUTH_SOCK >/tmp/.ssh-script
   . /tmp/.ssh-script
   echo $SSH_AGENT_PID >/tmp/.ssh-agent-pid
   ssh-add ~/.ssh/id_rsa
fi


function kill-agent {
   pid=`cat /tmp/.ssh-agent-pid`
   kill $pid
}


export EDITOR=/usr/bin/vim

#source /etc/bash_completion.d/git
source /etc/bash_completion.d/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=TRUE
GIT_PS1_SHOWSTASHSTATE=TRUE
GIT_PS1_SHOWUNTRACKEDFILES=TRUE
GIT_PS1_SHOWUPSTREAM="auto"

#export PROMPT_COMMAND='echo -ne "\e]2;${HOSTNAME}:${PWD}\a\e]1;\a"'
#export PS1="\[\033[1;32m\]\u\[\033[1;31m\]@\h\[\e[0m\]$ "
export PS1='\[\033[1;32m\]\u\[\033[1;31m\]@\h:\[\033[0;33m\]\w\[\e[0;35m\]$(__git_ps1 "(%s)")\[\e[0m\]$ '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
