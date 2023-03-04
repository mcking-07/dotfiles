# custom bash aliases by @mcking-07

# batcat command
alias bat='batcat'

# change directory
alias ..='cd ..'
alias ...='cd -'

# check open ports
alias ports='netstat -tulanp'

# copy with a progress bar
alias cpv='rsync -ah --info=progress2'

# docker commands
alias dkps='docker ps'
alias dkpsa='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"'
alias dkimg='docker image ls --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}" | sort'
alias dkstrt='docker start'
alias dkstp='docker stop'
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dklgs='docker logs'
alias dkvlm='docker volume ls'
alias dkntrk='docker network ls'
alias dkterm='docker exec -it'
alias dcps='docker-compose ps'
alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dcdrm='docker-compose down --rmi local -v'

# find a file
alias fgrep='find . | grep'

# find an old command
alias hgrep='history | grep'

# get process details
alias pxgrep='ps aux | grep'

# git commands
alias clone='git clone'
alias gb='git branch'
alias gs='git status'
alias gl='git log'
alias gps='git push'
alias gp='git pull'
alias gpo='git pull origin main'
alias gsh='git stash'
alias gsp='git stash pop'
alias gco='git checkout'
alias gcm='git checkout main'
alias gw='git whatchanged'

# launch http server
serve() {
  if [ "$1" != '' ]; then
    command python3 -m http.server "$1" | lt -p "$1"
  else
    command python3 -m http.server 8000 | lt -p 8000
  fi
}
alias servelocal='python3 -m http.server'

# xdg-open
alias open='xdg-open'
