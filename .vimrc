" pathogen plugin loading
call pathogen#infect()
call pathogen#helptags()

"let g:JSLintHighlightErrorLine = 0

" ruby syntax highlighting for thor
autocmd BufNewFile,BufRead *.thor, *.rabl
  \ set syntax=ruby

" Puppet manifest & spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" turn highlighting on
set t_Co=16 " console support for 16 colors
syntax on
set hlsearch

set ruler " always display cursor position
set directory=~/.vim/backups " stuff swp and tmp files here
set backupdir=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" turn off auto-adding comments on next line
set fo=tcq
set nocompatible
set modeline

" define colorsheme
colorscheme vividchalk

" set tab space
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" autocompletion
filetype plugin on
set ofu=syntaxcomplete#Complete

" force UTF-8 character encoding
set bomb
set encoding=utf-8
set fileencoding=utf-8

" key mappings
map <C-n> :NERDTreeToggle<CR>

" enable indendation match for =>'s
filetype plugin indent on
