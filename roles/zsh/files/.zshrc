export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" 
plugins=(git zsh-autosuggestions)
bindkey -s '^f' 'tmux-sessionizer\n'
export PATH="$PATH:/opt/nvim-linux64/bin"
alias vim=nvim
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

echo "Hi Friedrich, happy hacking..."