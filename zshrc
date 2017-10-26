#source $CONFIG/zsh-git-prompt/zshrc.sh
#export GIT_PROMPT_EXECUTABLE="haskell"
#PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%B%2~%b$(git_super_status) %# '
PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%B %C%b %# '
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# key bindings
bindkey \^U backward-kill-line
# This is used to override the fzf key binding, the old fashion is better as
# the fzf will truncate the command.
bindkey '^R' history-incremental-search-backward

HISTSIZE=130000 SAVEHIST=130000
PATH="/Users/yirui/bin:$PATH"
PATH="/Users/yirui/devtools/buck/bin/:$PATH"
PATH="/opt/local/bin:$PATH"
alias findc='find . -iname'
alias findcf='find . -type f -iname'
alias findcd='find . -type d -iname'

set -o ignoreeof
