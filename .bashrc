parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

nice_cwd() {
    if [[ "$HOME${PWD#$HOME}" == $PWD ]]; then
        echo "~/${PWD#$HOME}";
    elif [[ "$PWD/" == $HOME ]]; then
        echo "~";
    else
        echo $PWD;
    fi
}

USER="\u"
HOSTNAME="\h"
export PS1="$USER@$HOSTNAME: \[\e[32m\]\$(nice_cwd) [\$?]\[\e[91m\]\$(parse_git_branch)\[\e[00m\]\\$\[$(tput sgr0)\] "
alias dirs="dirs -v"
