export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined" # set by `omz`
CASE_SENSITIVE="true"
export EDITOR=hx
export USER=pollivie
export MAIL=pollivie@student.42.fr
export CLANGD_FLAGS="--enable-config --header-insertion=never"

plugins=(z git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-vi-mode)

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source $ZSH/oh-my-zsh.sh

alias cat="bat"
alias cbench='hyperfine --warmup 3 --min-runs 5 "./main"'
alias comp="cc -Wall -Wextra -Werror -g3 *.c -o main && ./main"
alias dbg="./dbg.sh"
alias form="pipx run c_formatter_42 < *.c *.c"
alias formh="pipx run c_formatter_42 < *.h *.h"
alias l="eza --long --header --icons --git --tree --level=2"
alias la="eza --long --header --icons --git --tree --level=2"
alias lz="lazygit"
alias m="make"
alias nn="ya"
alias no="pipx run norminette"
alias or="omz reload"
alias run="./run.sh"
alias s="eza --long --header --icons --git --tree --level=2"
alias sc="grep -r"
alias sd="cd ~/workspace/ && cd \$(find * -type d | fzf)"
alias sfc="cd \$(find * -type d | fzf -ei --algo=v2 --query 'cpp$ | zig$ | c$ |h$ | cpp$ | hhp$')"
alias sht="sh *.sh"
alias zb="zig build"
alias zbr="zig build run"
alias zbt="zig build test"
alias zr="zig run *.zig"
alias zt="zig test *.zig"
export PATH="$PATH:/home/pollivie/local/bin"

# Created by `pipx` on 2024-03-29 08:48:52
export PATH="$PATH:/home/pollivie/.local/bin"


eval "$(atuin init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
