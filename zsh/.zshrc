export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 30
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-vi-mode)

BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='hx'
 else
   export EDITOR='hx'
 fi

nn ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

# Change working dir in shell to last dir in lf on exit (adapted from ranger).
#
# You need to either copy the content of this file to your shell rc file
# (e.g. ~/.bashrc) or source this file directly:
#
#     LFCD="/path/to/lfcd.sh"
#     if [ -f "$LFCD" ]; then
#         source "$LFCD"
#     fi
#
# You may also like to assign a key (Ctrl-O) to this command:
#
#     bind '"\C-o":"lfcd\C-m"'  # bash
    bindkey -s '^d' 'lfcd\n'  # zsh
#

lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
SHELL=/bin/bash skhd --start-service

source /Users/plgol.perso/.config/broot/launcher/bash/br
# export USER=plgol.perso
export USER=pollivie
export MAIL=pollivie@student.42.fr

alias comp="cc -Wall -Wextra -Werror -ggdb *.c -o main && ./main"
alias compdbg="cc -Wall -Wextra -Werror -ggdb *.c -o main && lldb ./main" 
alias form="python3 -m c_formatter_42 < *.c"
alias formh="python3 -m c_formatter_42 < *.h"
alias sd="cd ~ && cd \$(find * -type d | fzf)"
alias ls="exa"
alias cat="bat"
alias z="~/zig_0.11.0/zig"
alias m="make"
alias zb="zig build"
alias zt="zig test *.zig"
alias zr="zig run *.zig"
alias zbr="zig build run"
alias zbt="zig build test"

# opam configuration
[[ ! -r /Users/plgol.perso/.opam/opam-init/init.zsh ]] || source /Users/plgol.perso/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH=$PATH:opt/homebrew/opt/python@3.11/Frameworks/Python.framework/Versions/3.11/bin