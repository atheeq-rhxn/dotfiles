# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

eval "$(starship init bash)"

. "$HOME/.cargo/env"

function z() {
	zellij
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function c() {
  clear
}

function e() {
  exit
}

function r() {
  systemctl --user restart xremap.service
}

export HELIX_RUNTIME="~/src/helix/runtime"
eval "$(zoxide init --cmd cd bash)"
export PATH="$PATH":~/.local/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"

export LANG=en_US.utf8
export LC_ALL=en_US.utf8
export FUNCTIONS_DISCOVERY_TIMEOUT=240
export SKIP_PACKAGE_CHECK=1
# export JAVA_HOME=~/jdks/jdk-21.0.7+6
# export PATH=$JAVA_HOME/bin:$PATH
