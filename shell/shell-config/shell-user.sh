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
export MAKEFLAG="-j8"
export MAKEFLAGS="-j8"
export CC="clang"
export CXX="clang++"
export EDITOR="hx"

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
path+=('/home/pollivie/.cargo/bin')
