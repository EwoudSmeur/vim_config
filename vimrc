set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" easily deal with brackets
Plugin 'tpope/vim-surround'
" nerdtree
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line" Configure ctrlp

" Ctrl-p settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
" Ignore certain folders
set wildignore+=*/var/*,*/doc/*

"set leader key
let mapleader = "\<Space>"

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType c setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  " autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

set relativenumber
set number

"Make Ctrl-[ also exit in visual mode
vnoremap <Ctrl>[ <Esc>

"Use the evening color scheme
colo evening

"Use smart indentation
set smartindent

"set search parameters
set incsearch hlsearch ic smartcase

" Set mouse to 'alles wat je verwacht'
set mouse=a

"NERDTree mappings
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>f :NERDTreeFind<CR>

"other mappings
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
