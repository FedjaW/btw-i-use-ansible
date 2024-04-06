# zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions)
ZSH_THEME="robbyrussell" 
source $ZSH/oh-my-zsh.sh

# tmux
bindkey -s '^f' 'tmux-sessionizer\n'

# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
alias vim=nvim

# zoxdide
export PATH="/home/fwilms/.local/bin:$PATH"
eval "$(zoxide init zsh)"

# go
export PATH=$PATH:/usr/local/go/bin

# greeting
echo "Hi Friedrich, happy hacking..."
