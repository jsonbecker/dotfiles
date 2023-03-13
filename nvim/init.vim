set shell=/bin/zsh

" vim-plug Stuff
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
" Vundle Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/The-NERD-tree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'chrismccord/bclose.vim'
Plug 'dracula/vim'
Plug 'jalvesaq/Nvim-R'
Plug 'chrisbra/csv.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'c-brenn/phoenix.vim'
Plug 'mhinz/vim-mix-format'
Plug 'mattreduce/vim-mix'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
Plug 'sbdchd/neoformat'

call plug#end()

syntax enable " Turn on syntax highlighting  
:colorscheme Dracula
set hidden " Leave hidden buffers open  
set history=100 "by default Vim saves your last 8 commands.  We can handle more  
set number
set guifont=Berkeley\ Mono:h13
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

" Map Escape
imap ;; <Esc>

" Map NERDTree
nnoremap <silent> nt :NERDTree <CR>

" Clean up split colors that get too crazy with gitgutter.
" hi vertsplit guifg=bg guibg=fg
:highlight VertSplit cterm=none gui=none 
:highlight SignColumn ctermbg=black guibg=#000000

" See .md as markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.mmd set filetype=markdown

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

" Settings for prettier
let g:neoformat_try_node_exe = 1

" Kill stupid vim-r assignment
let vimrplugin_assign = 0
let R_assign = 0

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewfile mix.lock set filetype=elixir
au BufRead,BufNewfile *.sql set filetype=sql
