export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" 
plugins=(git zsh-autosuggestions)
bindkey -s '^f' 'tmux-sessionizer.sh^M'
export PATH="$PATH:/opt/nvim-linux64/bin"
alias vim=nvim
source $ZSH/oh-my-zsh.sh
echo "Hi Friedrich, happy hacking..."