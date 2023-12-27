export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jonathan" # set by `omz`
CASE_SENSITIVE="true"
export PATH=$PATH:~/.cargo/bin:
export EDITOR=hx
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-vi-mode)

BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

nn ()
{
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    command nnn -C "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

SHELL=/bin/bash skhd --start-service

alias comp="cc -Wall -Wextra -Werror -g3 *.c -o main && ./main"
alias form="~/script/format.sh"
alias sd="cd ~ && cd \$(find * -type d | fzf)"
alias ls=lsd
alias z="~/zig_0.11.0/zig"
alias m="make"
alias zb="zig build"
alias zt="zig test *.zig"
alias zr="zig run *.zig"
alias zbr="zig build run"
alias zbt="zig build test"
alias lz="lazygit"
alias or="omz reload"
alias no="norminette"
alias sc="grep -r"
alias sht="sh *.sh"
alias cbench='hyperfine --warmup 3 --min-runs 5 "./main"'

[[ ! -r /Users/plgol.perso/.opam/opam-init/init.zsh ]] || source /Users/plgol.perso/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export USER=plgol.perso
# export USER=pollivie
export MAIL=pollivie@student.42.fr

source $ZSH/oh-my-zsh.sh
