# zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions)
ZSH_THEME="robbyrussell" 
source $ZSH/oh-my-zsh.sh

# tmux
bindkey -s '^f' 'tmux-sessionizer\n'

# nvim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
alias vim=nvim

# go
export PATH=$PATH:/usr/local/go/bin

# git
alias l='ls -lah'
alias gl='. /usr/local/bin/githelpers && pretty_git_log'
alias gst='git status'
alias ga='git add .'
alias gc='git commit'
alias gd='git diff'

# general
alias ..='cd ..'

# greeting
echo "Hi Friedrich, happy hacking..."
