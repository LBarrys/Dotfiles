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

export EDITOR=micro

##########
# Promit #
##########

PS1='\[\033[1;32m\]\u \[\033[0;37m\]\W \[\033[1;32m\]>\[\033[0;37m\] '

###########
# Aliases #
###########

# General
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias cat='bat -pp'
alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

# DNF
alias i='sudo dnf install'
alias r='sudo dnf remove'
alias u='sudo dnf update --refresh'
alias s='dnf search'
alias autoremove='sudo dnf autoremove'
alias list-installed='dnf list --installed'

# Timeshift
alias timeshiftC='sudo timeshift --create && sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
alias timeshiftR='sudo timeshift --restore && sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
alias timeshiftD='sudo timeshift --delete && sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

# Colors

NOCOLOR='\033[0m'
BLACK='\033[30m'
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
CYAN='\033[36m'
WHITE='\033[1;37m'

#############
# Fastfetch #
#############

fastfetch --color green
