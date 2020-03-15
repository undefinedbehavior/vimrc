#source $CONFIG/zsh-git-prompt/zshrc.sh
#export GIT_PROMPT_EXECUTABLE="haskell"
#PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%B%2~%b$(git_super_status) %# '
PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%B %C%b %# '
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# key bindings
bindkey \^U backward-kill-line

HISTSIZE=130000 SAVEHIST=130000
PATH="/Users/yirui/bin:$PATH"
PATH="/Users/yirui/devtools/buck/bin/:$PATH"
PATH="/opt/local/bin:$PATH"
alias findc='find . -iname'
alias findcf='find . -type f -iname'
alias findcd='find . -type d -iname'

set -o ignoreeof
