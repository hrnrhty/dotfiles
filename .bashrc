#                         __               __
#                        / /_  ____ ______/ /_  __________
#                       / __ \/ __ `/ ___/ __ \/ ___/ ___/
#                    _ / /_/ / /_/ (__  ) / / / /  / /__
#                   (_)_.___/\__,_/____/_/ /_/_/   \___/
#
#                                                   - .bashrc
#
#-----------------------------------------------------------------------------
# if not running interactively, don't do anyting
[ -z "$PS1" ] && return

#---- settings ----
umask 022
set -o noclobber
set -o ignoreeof
set -o notify
export PS1='[\u@\h \W]\$ '
export PS2='> '
export HISTSIZE=1000
export LSCOLORS=exfxcxdxbxegedabagacad
if [ -e ${HOME}/bin ]; then
    export PATH=${PATH}:${HOME}/bin
fi

#---- fzf ----
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
bind '"ç": "\ec"'
export FZF_DEFAULT_COMMAND='find . -path './.git' -prune -o -print'
export FZF_CTRL_T_COMMAND='find . -path './.git' -prune -o -print'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info --preview "head -200 {}"'
export FZF_ALT_C_OPTS='--no-preview'

#---- aliases ----
if [ `echo ${OSTYPE} | grep 'darwin'` ]; then
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

# git
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
alias gh='git log --color --decorate --graph --oneline'
alias gha='git log --color --decorate --graph --oneline --all'
alias gl='git log --color'
alias gln='git log --color --name-only'
alias gls='git log --color --stat'
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

# subversion
alias svc='svn commit'
alias svd='svn diff | vim -'
alias svi='svn info'
alias svl='svn log | vim -'
alias svlv='svn log -v | vim -'
alias svs='svn status'
alias svu='svn update'

#---- local settings ----
[ -e ~/.bashrc.local ] && source ~/.bashrc.local
