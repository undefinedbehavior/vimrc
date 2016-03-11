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
set cinoptions=(0
" show number
set number
" syntax
syntax on
set t_Co=256
syntax enable
set hls
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
set spell spelllang=en_us
" Color column
set cursorline
set colorcolumn=80,120
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
" Increase search
set incsearch

"""""""""" Other MAPPING """"""""""
" Replace `wq` with `w`
cabbrev wq w
" Remap leader
let mapleader=","
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
" let search result in the middle of screen
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

"""""""""" PLUGINS """"""""""
call vundle#begin($VimConfigPath.'/bundle')
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-scripts/listmaps.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'rust-lang/rust.vim'
call vundle#end()

" YCM Setting
let g:ycm_confirm_extra_conf=0
" Airline Setting
" Deprecated status line
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
set laststatus=2
set ambiwidth=double
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_detect_paste=1
let g:airline_detect_modified=1
" unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
" powerline symbols
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''
let g:airline_symbols.whitespace='Ξ'
let g:airline_symbols.paste='ρ'
let g:airline_symbols.branch='⎇'
" reduce the lag between the switch of mode
set timeoutlen=666
" tmuxline
let g:tmuxline_preset={
    \'a'    :   '#S',
    \'b'    :   '#W',
    \'win'  :   '#I #W',
    \'cwin' :   '#I #W #F',
    \'y'    :   ['%R', '%m/%d', '%a'],
    \'z'    :   '#H'}

" Unite Setting
nnoremap <silent> <leader>m :<C-u>Unite -buffer-name=recent -winheight=10 file_mru<CR>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffers -winheight=10 buffer<CR>

" FZF Setting
nnoremap <leader>f :<C-u>FZF 

"""""""""" OTHER """"""""""
" Auto change PWD
autocmd BufEnter * silent! lcd %:p:h
" Leave some context at the end
set scrolloff=10
" Set history/undo size
set history=1000
set undolevels=1000
" No need to save when switching buffer
set hidden
filetype plugin indent on
" remove tailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
function! TrimWhiteSpace()
        %s/\s\+$//e
endfunction
nnoremap <leader>t :call TrimWhiteSpace()

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufRead,BufNewFile *.rs set filetype=rust
