syntax enable " Turn on syntax highlighting  
:colorscheme Tomorrow-Night-Bright
set hidden " Leave hidden buffers open  
set history=100 "by default Vim saves your last 8 commands.  We can handle more  
set number
set guifont=Source\ Code\ Pro\ For\ Powerline:h16
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



" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType ruby setlocal ts=4 sts=4 sw=4 expandtab

"Treat .rss files as XML
autocmd BufNewFile,BufRead *.rss setfiletype xml
