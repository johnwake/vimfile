#export PATH="$(brew --prefix homebrew/php/php53)/bin:$PATH"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='[ \[\e[0;96m\]\t\]-\e[1;95m\]\h \e[0;92m\]\]\w\e[0;93m\]$(parse_git_branch)\e[00m\] ]\n$ '

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=/usr/local/sbin:$PATH

eval $(docker-machine env dev)

alias be='bundle exec'
alias gc='git checkout'
alias gs='git status'
alias gd='git diff'
alias gfp='git fetch -p'
alias gpo='git push origin'
alias gcm='git commit -m'
alias ll='ls -la'
alias dc='docker-compose'
alias dm='docker-machine'
