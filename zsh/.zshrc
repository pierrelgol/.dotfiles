export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 30
# plugins=(git)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)


source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='hx'
 else
   export EDITOR='hx'
 fi

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="lsd -a"
alias lf="lfcd"

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

eval $(ssh-agent)
skhd --start-service
