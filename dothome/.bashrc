# .bashrc

# Source Global Definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User Specific Environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the Following Line if You Don't like systemctl's Auto-paging Feature:
# export SYSTEMD_PAGER=

# User Specific Aliases and Functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

source "$HOME/.config/bash"
