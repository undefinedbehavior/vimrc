source $CONFIG/zsh-git-prompt/zshrc.sh
export GIT_PROMPT_EXECUTABLE="haskell"
PROMPT='%B%2~%b$(git_super_status) %# '
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

HISTSIZE=130000 SAVEHIST=130000
PATH="/Users/yirui/bin:$PATH"
PATH="/Users/yirui/devtools/buck/bin/:$PATH"
PATH="/opt/local/bin:$PATH"
alias findc='find . -iname'
alias findcf='find . -type f -iname'
alias findcd='find . -type d -iname'

