#!/bin/sh

source $HOME/shell-config/shell-function.sh


################################################################################
# USER                                                                         #
################################################################################

export USER=pollivie
export MAIL=plgol.perso@gmail.com
export USER42="pollivie"
export EMAIL42="pollivie@student.42.fr"
export SCHOOL42="42"
export CLANGD_FLAGS="--enable-config --header-insertion=never"

################################################################################
# CC                                                                           #
################################################################################

if command -v zig > /dev/null
then
  export CC="zig cc"
elif command -v clang > /dev/null
then
  export CC="clang"
elif command -v gcc > /dev/null
then
  export CC="gcc"
else
  echo "No suitable C compiler found. Please install zig, clang, or gcc."
fi

################################################################################
# EDITOR                                                                       #
################################################################################

if command -v hx > /dev/null
then
  export EDITOR="hx"
elif command -v nvim > /dev/null
then
  export EDITOR="nvim"
elif command -v vim > /dev/null
then
  export EDITOR="vim"
elif command -v vi > /dev/null
then
  export EDITOR="vi"
elif command -v nano > /dev/null
then
  export EDITOR="nano"
else
  echo "No suitable editor found. Please install hx, nvim, vim, vi, or nano."
fi

################################################################################
# XDG_SETUP                                                                    #
################################################################################

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
create_dir_if_not_exists "$XDG_DATA_HOME"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
create_dir_if_not_exists "$XDG_CONFIG_HOME"

export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
create_dir_if_not_exists "$XDG_STATE_HOME"

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
create_dir_if_not_exists "$XDG_CACHE_HOME"

if [ -z "$XDG_RUNTIME_DIR" ]; then
  export XDG_RUNTIME_DIR="/run/user/$UID"
  if [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
  fi
else
  create_dir_if_not_exists "$XDG_RUNTIME_DIR"
fi

export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_DATA_HOME XDG_CONFIG_HOME XDG_STATE_HOME XDG_CACHE_HOME XDG_RUNTIME_DIR XDG_DATA_DIRS XDG_CONFIG_DIRS

################################################################################
# PATH                                                                         #
################################################################################

path+=('/home/pollivie/local/bin')
path+=('/home/pollivie/local/repo')
path+=('/home/pollivie/.local/bin')
path+=('/home/pollivie/.local/share/applications')
