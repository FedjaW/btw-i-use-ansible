export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" 
plugins=(git zsh-autosuggestions)
bindkey -s '^f' 'tmux-sessionizer\n'
export PATH="$PATH:/opt/nvim-linux64/bin"
alias vim=nvim
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

export PATH=$PATH:/usr/local/go/bin

echo "Hi Friedrich, happy hacking..."
