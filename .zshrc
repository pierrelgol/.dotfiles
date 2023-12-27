export CPATH=~/app/clangd-linux-17.0.3/clangd_17.0.3/lib/clang/17/:$CPATH
export CPATH=~/app/clangd-linux-17.0.3/clangd_17.0.3/lib/clang/17/include/:$CPATH
export C_INCLUDE_PATH=/app/clangd-linux-17.0.3/clangd_17.0.3/lib/clang/17/include/

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export VISUAL=~/app/helix-23.10-x86_64-linux/./hx
export EDITOR=~/app/helix-23.10-x86_64-linux/./hx

nnn_cd()                                                                                                   
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi  
}

trap nnn_cd EXIT

nnn ()
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
    command ~/app/./nn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

export PATH="~/app/:$PATH"
export PATH="~/app/lsp:$PATH"
export PATH="~/app/lsp/clangd:$PATH"
export PATH="~/app/lsp/include/:$PATH"
export PATH="~/app/lsp/zls:$PATH"
export PATH="~/app/zig-linux-x86_64/zig:$PATH"
export PATH="~/app/helix-23.10-x86_64-linux/hx:$PATH"
export PATH="~/app/helix-23.10-x86_64-linux/./hx:$PATH"
alias comp="cc -Wall -Werror -Wextra -Weverything *.c -o main && ./main"
alias form="python3 -m c_formatter_42 < *.c"
alias hx="~/app/helix-23.10-x86_64-linux/./hx"
alias clangd="~/app/lsp/./clangd"
alias zls="~/app/lsp/./zls"
alias zig="~/app/zig-linux-x86_64/./zig"
alias nn="nnn"

