#export PATH="$(brew --prefix homebrew/php/php53)/bin:$PATH"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='[ \[\e[0;96m\]\t\]-\e[1;95m\]\h \e[0;92m\]\]\w\e[0;93m\]$(parse_git_branch)\e[00m\] ]\n$ '

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=/usr/local/sbin:$PATH
#source /Users/johnwakeling/Work/devtools/.source
#ssh-add /Users/johnwakeling/Work/devtools/keys/* &> /dev/null
#ssh-add /Users/johnwakeling/.vagrant.d/insecure_private_key &>/dev/null

eval $(docker-machine env dev)

alias be='bundle exec'
alias gc='git checkout'
alias gs='git status'
alias gd='git diff'
alias gfp='git fetch -p'
alias gpo='git push origin'
alias gcm='git commit -m'
alias fca='funding_circle_app'
alias ll='ls -la'
alias dc='docker-compose'
alias dm='docker-machine'
alias galaga='galaga.fcuat.co.uk'

#LEGACY
export FCA_ROOT=~/git/funding_circle_app
export PROJECTS_DIR=~/git/

# KAFKA
export KAFKA_ADDRESS=$(docker-machine ip dev):9092
export ZOOKEEPER_ADDRESS=$(docker-machine ip dev):2181
export SCHEMA_REGISTRY_URL=http://$(docker-machine ip dev):8081

function uatstatus() {
  ssh $1 supervisorctl status | sed -E -e "s/RUNNING/$(tput bold)$(tput setaf 2)&$(tput sgr0)/g" -e "s/STARTING/$(tput bold)$(tput setaf 3)&$(tput sgr0)/g" -e "s/FATAL|STOPPED/$(tput bold)$(tput setaf 1)&$(tput sgr0)/g"
}
