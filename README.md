VIMRC by Yirui
====================
![](screenshot.png)
# Requirement
+ latest fat vim and python
+ to support better theme, change terminal to support 256 color
+ to support better status bar, change terminal to use patched font (search powerline-font for detail)

# Plugin Special Install
> 0. in your $HOME/.vimrc, define var VimConfigPath to this vimrc folder and source vimrc.vim under vimrc
> 1. `git submodule update --init --recursive`
> 2. cd YCM and exe install.sh
> 3. cd vimproc and exe make
> 4. cd zsh-git-prompt and type `cabal build`

# TODO
+ neobundle to make plugin install automatically
+ taglist
+ YCM adv setting

