############################
# Oh My Zsh configuration. #
############################

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# robbyrussell - Default theme.
#ZSH_THEME="robbyrussell"

# powerlevel9k - Theme configuration.
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# Plugins.
plugins=(git)

# Source Oh My Zhs.
source $ZSH/oh-my-zsh.sh

##########################
# OS dependent settings. #
##########################
if [[ `uname` == "Linux" ]]; then
    source ~/.zshrc_linux
elif [[ `uname` == "Darwin" ]]; then
    source ~/.zshrc_mac
else
    echo 'Unknown OS!'
fi

#################
# Load aliases. #
#################
source ~/.zsh_aliases

#####################
# Private settings. #
#####################
if [[ -f ~/.zshrc_private ]]; then
    source ~/.zshrc_private
fi

##################
# Enable direnv. #
##################
eval "$(direnv hook zsh)"
