export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="refined" # set by `omz`
CASE_SENSITIVE="true"
export PATH=$PATH:~/.cargo/bin:
export PATH=$PATH:~/local/bin:
export PATH=$PATH:/Applications/Ghostty.app/Contents/MacOS:

export EDITOR=hx
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30

plugins=(z git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-vi-mode)
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

# export USER=plgol.perso
export USER=pollivie
export MAIL=pollivie@student.42.fr

source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/swift/bin:$PATH"

alias cat="bat"
alias cbench='hyperfine --warmup 3 --min-runs 5 "./main"'
alias comp="cc -Wall -Wextra -Werror -g3 *.c -o main && ./main"
alias dbg="./dbg.sh"
alias form="python3 -m c_formatter_42 < *.c *.c"
alias formh="python3 -m c_formatter_42 < *.h *.h"
alias l="eza --long --header --icons --git --tree --level=2"
alias la="eza --long --header --icons --git --tree --level=2"
alias lz="lazygit"
alias m="make"
alias nn="ya"
alias no="norminette"
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


# bun completions
[ -s "/Users/plgol/.bun/_bun" ] && source "/Users/plgol/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(atuin init zsh)"
