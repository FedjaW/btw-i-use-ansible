export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" 
plugins=(git zsh-autosuggestions)
bindkey -s '^f' 'tmux-sessionizer.sh^M'
alias vim=nvim
source $ZSH/oh-my-zsh.sh
echo "Hi Friedrich, happy hacking..."