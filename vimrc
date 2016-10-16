" Vim hates fish
set shell=/bin/bash

" Vundle Stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'bling/vim-airline'
Plugin 'chrismccord/bclose.vim'
Plugin 'jalvesaq/Nvim-R'
call vundle#end()
filetype plugin indent on

autocmd VimEnter * NERDTree

syntax enable " Turn on syntax highlighting  
:colorscheme Tomorrow-Night-Bright
set hidden " Leave hidden buffers open  
set history=100 "by default Vim saves your last 8 commands.  We can handle more  
set number
set guifont=Hack:h13
set splitright
set splitbelow
set encoding=utf-8
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set backspace=indent,eol,start
set incsearch
set wrap

" Remap Escape
imap jk <Esc>

" Clean up split colors that get too crazy with gitgutter.
" hi vertsplit guifg=bg guibg=fg
:highlight VertSplit cterm=none gui=none 
:highlight SignColumn ctermbg=black guibg=#000000

" See .md as markdown
au BufRead,BufNewFile *.md setfiletype=markdown
au BufRead,BufNewFile *.mmd setfiletype=markdown

" Taken from Ted -- less annoying swaps
" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
 silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" Save on window blur
au FocusLost * :wa

" Fix OSX Clipboard via Dr. Bunsen
noremap <leader>y "*y
noremap <leader>yy "*Y
" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

" Style-guide based customizations (Allovue)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType ruby setlocal ts=4 sts=4 sw=4 expandtab

"Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Settings for Markdown plugins
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1

" Settings for powerline
let g:airline_powerline_fonts = 1
let g:air_powerline_symbols = 'fancy'

" Kill stupid vim-r assignment
let vimrplugin_assign = 0
