set nocompatible
filetype off

"""""""""" PATH SETTING """"""""""
set rtp+=$VimConfigPath
set rtp+=$VimConfigPath/bundle/Vundle.vim
set noundofile
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup//
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo
  endif
  set undodir+=~/.vim/undo//
  set undofile
endif

"""""""""" FORMAT """"""""""
" setup indent, tab, etc.
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
" show number
set number
" syntax
syntax on
set t_Co=256
syntax enable
set hls
set background=dark
colorscheme solarized
" Color column
set cursorline
set colorcolumn=80
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
" Increase search
set incsearch

"""""""""" KEY MAPPING """"""""""
" Clear highlights when flashing screen
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" browse command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" browse buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" expand current file's directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" set mouse
set mouse=a

"""""""""" PLUGINS """"""""""
call vundle#begin($VimConfigPath.'/bundle')
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
call vundle#end()

" Airline Setting
" Deprecated status line
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
set laststatus=2
set ambiwidth=double
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_detect_paste = 1
let g:airline_detect_modified = 1
" unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.branch = '⎇'
" reduce the lag between the switch of mode
set timeoutlen=50
" tmuxline
let g:tmuxline_preset = {
    \'a'    :   '#S',
    \'b'    :   '#W',
    \'win'  :   '#I #W',
    \'cwin' :   '#I #W #F',
    \'y'    :   ['%R', '%m/%d', '%a'],
    \'z'    :   '#H'}


"""""""""" OTHER """"""""""
" set history size
set history=200
filetype plugin indent on

