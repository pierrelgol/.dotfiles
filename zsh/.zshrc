export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined" # set by `omz`
CASE_SENSITIVE="true"
export PATH=$PATH:~/.cargo/bin:
export PATH=$PATH:~/local/bin:
export PATH=$PATH:/Applications/Ghostty.app/Contents/MacOS

export EDITOR=hx
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-vi-mode)
# plugins=(git zsh-autosuggestions zsh-vi-mode)

SHELL=/bin/bash skhd --start-service

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias nn="ya"
alias comp="cc -Wall -Wextra -Werror -g3 *.c -o main && ./main"
alias form="python3 -m c_formatter_42 < *.c *.c"
alias formh="python3 -m c_formatter_42 < *.h *.h"
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
alias run="./run.sh"
alias dbg="./dbg.sh"

# export USER=plgol.perso
export USER=pollivie
export MAIL=pollivie@student.42.fr

source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/swift/bin:$PATH"
