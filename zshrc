[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

HISTSIZE=130000 SAVEHIST=130000
PATH="/Users/yirui/bin:$PATH"
PATH="/Users/yirui/devtools/buck/bin/:$PATH"
PATH="/opt/local/bin:$PATH"
alias sdkbuild='/Applications/Xcode.app/Contents/Developer/Platforms/osmeta.platform/Developer/usr/bin/build'
alias lldb='~/osmeta_src/prebuilt/Darwin-x86_64/usr/bin/lldb'
alias adb='~/osmeta_src/prebuilt/Darwin-x86_64/android/sdk/platform-tools/adb'
alias findc='find . -iname'
alias findcf='find . -type f -iname'
alias findcd='find . -type d -iname'

