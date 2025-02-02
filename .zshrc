# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

### Set variables
#################
PATH="/usr/local/bin:/usr/local/sbin/:$PATH"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
EDITOR=nvim

ELECTRON_OZONE_PLATFORM_HINT=auto


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# direnv
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


### Set alias
#############
alias cls="clear"
alias cd="z"
alias ..="cd .."
alias cd..="cd .."
#alias ll="ls -lisa --color=auto"
alias home="cd ~"
alias df="df -ahiT --total"
alias mkdir="mkdir -pv"
alias mkfile="touch"
alias rm="rm -rfi"
alias userlist="cut -d: -f1 /etc/passwd"
#alias ls="ls -CF --color=auto"
#alias lsl="ls -lhFA | less"
alias free="free -mt"
alias du="du -ach | sort -h"
#alias ps="ps auxf"
#alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias wget="wget -c"
alias histg="history | grep"
alias myip="curl http://ipecho.net/plain; echo"
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
#alias grep='grep --color=auto'

alias cat='bat'
alias ps='procs'
# alias ls='eza --icons -F -H --group-directories-first --git -1'
# alias l='ls -ahlF'

alias ls='eza'                                                          # ls
alias l='eza -lbF --git'                                                # list, size, type, git
alias ll='eza -lbGF --git'                                              # long list
alias llm='eza -lbGd --git --sort=modified'                             # long list, modified date sort
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'   # all list
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'  # all + extended list
alias lS='eza -1'                                                       # one column, just names
alias lt='eza --tree --level=2'                                         # tree

alias grep='rg'
alias lg='lazygit'
alias ld='lazydocker'
alias ssh='TERM=xterm-256color ssh'
