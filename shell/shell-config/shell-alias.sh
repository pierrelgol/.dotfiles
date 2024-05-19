#!/bin/sh

source $HOME/shell-config/shell-function.sh

YAZI_FUNCTION=ya

if command -v bat &> /dev/null
then
  alias cat="bat"
else
  echo "shell: bat not found"
fi

if command -v eza &> /dev/null
then
  alias ls="eza --color --long --header --icons --git"
  alias la="eza --all --color --long --header --icons --git"
  alias tree="eza --all --color --icons --git --tree"
else
  echo "shell: eza not found"
fi

if command -v zig &> /dev/null
then
  alias zb="zig build"
  alias zbr="zig build run"
  alias zbt="zig build test"
  alias zr="zig run *.zig"
  alias zt="zig test *.zig"
else
  echo "shell: zig not found"
fi

if command -v pipx &> /dev/null
then
    alias form="pipx run c_formatter_42 < *.c *.c"
    alias formh="pipx run c_formatter_42 < *.h *.h"
else
  echo "shell: pipx not found"
fi


if command -v yazi &> /dev/null && declare -F "$YAZI_FUNCTION" > /dev/null
then
  alias nn="yy"
else
  echo "shell: yazi or function $YAZI_FUNCTION not found"
fi

if command -v lazygit &> /dev/null
then
  alias lz="lazygit"
else
  echo "shell: lazygit not found"
fi

alias dbg="./dbg.sh"
alias run="./run.sh"
alias reload="exec zsh"

if command -v pbcopy &> /dev/null; then
  :
else
  if command -v xsel &> /dev/null; then
    alias pbcopy="xsel -bi"
  else
    echo "shell: xsel not found"
  fi
fi

if command -v pbpaste &> /dev/null; then
  :
else
  if command -v xsel &> /dev/null; then
    alias pbpaste="xsel -bo"
  else
    echo "shell: xsel not found"
  fi
fi

if command -v git &> /dev/null; then
  alias g='git'
  alias gaa='git add .'
  alias gcmsg='git commit -m'
  alias gst='git status'
  alias gl='git pull'
  alias gup='git fetch && git rebase'
  alias gp='git push'
  alias gc='git commit -v'
  alias gca='git commit -v -a'
  alias gco='git checkout'
  alias gcm='git checkout master'
  alias gb='git branch'
  alias gba='git branch -a'
  alias gcount='git shortlog -sn'
  alias gcp='git cherry-pick'
  alias glg='git log --stat --max-count=5'
  alias glgg='git log --graph --max-count=5'
  alias gss='git status -s'
  alias ga='git add'
  alias gm='git merge'
  alias grh='git reset HEAD'
  alias grhh='git reset HEAD --hard'
  alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
  alias gsr='git svn rebase'
  alias gsd='git svn dcommit'
  alias ggpull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
  alias ggpush='git push origin $(git rev-parse --abbrev-ref HEAD)'
  alias ggpnp='git pull origin $(git rev-parse --abbrev-ref HEAD) && git push origin $(git rev-parse --abbrev-ref HEAD)'
else
  echo "shell: git not found"
fi
