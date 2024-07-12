
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

source ~/.zsh_profile

# Make sure zsh cache is updated whenever PATH is modified.
zstyle ":completion:*:commands" rehash 1
