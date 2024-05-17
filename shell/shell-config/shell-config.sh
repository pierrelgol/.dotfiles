#!/bin/sh

################################################################################
# SHELL CONFIG MAIN                                                            #
################################################################################

###################
# ZINIT SETUP     #
###################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

###################
# PERSONAL CONFIG #
###################

source $HOME/shell-config/shell-completion.sh
source $HOME/shell-config/shell-function.sh
source $HOME/shell-config/shell-alias.sh
source $HOME/shell-config/shell-user.sh

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
autoload -U compinit && compinit

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###################
# KEYBINDINGS     #
###################
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

###################
# HISTORY         #
###################
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

###################
# COMPLETION      #
###################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
zstyle ':fzf-tab:complete:cd:__zoxide_z:*' fzf-preview 'ls $realpath'

################################################################################
# EVAL                                                                         #
################################################################################
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
eval "$(fzf --zsh)"
