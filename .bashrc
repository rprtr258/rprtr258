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
alias git-prune="git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d"


# >>>> Vagrant command completion (start)
. C:/HashiCorp/Vagrant/embedded/gems/2.2.16/gems/vagrant-2.2.16/contrib/bash/completion.sh
# <<<<  Vagrant command completion (end)

# ln ~/AppData/Local/nvim/init.vim ~/init.vim
alias vim=nvim-qt
