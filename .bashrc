#                         __               __
#                        / /_  ____ ______/ /_  __________
#                       / __ \/ __ `/ ___/ __ \/ ___/ ___/
#                    _ / /_/ / /_/ (__  ) / / / /  / /__
#                   (_)_.___/\__,_/____/_/ /_/_/   \___/
#
#                                                   - .bashrc
#
#=============================================================================
#==== General settings ====                                                {{{

umask 022
set -o noclobber
set -o ignoreeof
set -o notify

#---- Language ----
export LANG='ja_JP.UTF-8'

#---- Prompt ----
export PS1='[\u@\h \W]\$ '
export PS2='> '

#---- Other Settings ----
export HISTSIZE=1000
export LSCOLORS=exfxcxdxbxegedabagacad

# }}}
#=============================================================================
#==== Aliases ====                                                         {{{

if [ ${OSTYPE} = darwin13 ]
then
    alias ls='ls -CF -G'
else
    alias ls='ls -CF --color=auto --show-control-chars'
fi
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias du='du -hs'

#---- Git ----
alias gad='git add'
alias gb='git branch --color'
alias gba='git branch --color -a'
alias gc='git commit'
alias gca='git commit -a'
alias gch='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff --color'
alias gds='git diff --color --stat'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gh='git hist --color'
alias gha='git hist --color --all'
alias gl='git log --color'
alias gm='git merge'
alias gmv='git mv'
alias gpl='git pull'
alias gpla='git pull --all'
alias gps='git push'
alias gpsa='git push --all'
alias grb='git rebase'
alias grm='git rm'
alias grst='git reset --hard'
alias gs='git status'
alias gt='git tag'

# }}}
#=============================================================================
#==== Source local settings ====                                           {{{

if [ -e ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

# }}}
#=============================================================================
