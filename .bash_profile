alias l="ls -l"
alias ll="ls -l"

export LS_OPTIONS="-A --color=always -T 0"

test -s ~/.alias && . ~/.alias || true

export TERM=xterm-256color

source /usr/local/git/contrib/completion/git-completion.bash
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh

GIT_PS1_SHOWDIRTYSTATE=TRUE
GIT_PS1_SHOWSTASHSTATE=TRUE
GIT_PS1_SHOWUNTRACKEDFILES=TRUE
GIT_PS1_SHOWUPSTREAM="auto"

export PS1="\[\033[1;32m\]\u\[\033[1;31m\]@\h:\[\033[0;33m\]\w\e[0;35m\]\$(__git_ps1 '(%s)')\[\e[0m\]\n$ "

#export PS1="\[\033[1;32m\]\u\[\033[1;31m\]@\h:\[\033[0;33m\]\w\[\033[0m\]>"

SCALA_HOME=/Users/clive/Applications/scala-2.10.1
PLAY_HOME=/Users/clive/Applications/play-2.1.1

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

PATH=/usr/local/bin/:$PATH:~/bin:$SCALA_HOME/bin:$PLAY_HOME:/usr/local/share/npm/bin:/Users/clive/spark-1.5.2-bin-hadoop2.6/bin

[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/sbin:$PATH"
