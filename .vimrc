"set shell=/bin/bash\ --rcfile\ ~/.bash_profile\ -i

let mapleader = " "

" pathogen plugin loading
call pathogen#infect()
call pathogen#helptags()

" make backspace work like most other apps
set backspace=indent,eol,start

" preserve final newline EOL character of existing file
" vim by default will add newline characters to text files
"let g:PreserveNoEOL=1

" syntax checking
"let g:JSLintHighlightErrorLine = 0
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_javascript_checkers=['jsxlint']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1"
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ["java", "scss"]
  \ }
let g:syntastic_quiet_messages = {
  \ "!level": "errors",
  \ "regex": 'is not recognized!'
  \ }

" syntax highlighting
autocmd BufNewFile,BufRead *.thor, *.rabl
  \ set syntax=ruby
autocmd BufNewFile,BufRead *.jsx
  \ set syntax=javascript
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>
autocmd BufRead,BufNewFile *.md
  \ set filetype=markdown
  \ setlocal textwidth=100 " auto-wrap at 80 characters

" Dash API search filetype mappings
let g:dash_map = {
  \ 'ruby': 'rails',
  \ 'coffee': 'angularjs',
  \ 'javascript': 'jquery'
  \ }
cabbrev ? Dash

" Gist plugin
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" highlighting
set t_Co=16 " console support for 16 colors
syntax on
set hlsearch

set ruler " always display cursor position
set directory=~/.vim/backups " stuff swp and tmp files here
set backupdir=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" window management
set splitbelow
set splitright
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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
set ffs=unix,mac

" plugin key mappings
map <C-n> :NERDTreeToggle<CR>

if !empty(glob('.zeus.sock'))
  let g:rspec_command = '!zeus rspec {spec}'
endif
map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
map <Leader>s :.Rake<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
nmap <Leader>j :Rake RAILS_ENV=test spec:javascript<CR>
nmap <Leader>c :Rake RAILS_ENV=test cucumber <C-R>=expand("%:p")<CR>
nmap <Leader>r :Rake RAILS_ENV=test db:reset<CR>

" enable indendation match for =>'s
filetype plugin indent on

" plugins
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" control those tab autocompletes!
set wildmode=longest,list
set wildmenu

:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" show on buffer window enter
:autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" show on insert mode enter
":au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
":au InsertLeave * match ExtraWhitespace /\s\+$/

" Rails.vim projections
let g:rails_projections = {
  \   "app/forms/*_form.rb": {
  \     "command": "form",
  \     "test": "spec/forms/%s_form.rb",
  \     "template": "class %SForm \nend"
  \   },
  \   "spec/factories/*.rb": {
  \     "command": "factory",
  \     "affinity": "collection",
  \     "alternate": "app/models/%i.rb",
  \     "test": "spec/models/%i_spec.rb",
  \     "template": "FactoryGirl.define do\n factory :%i do\n end\nend"
  \   },
  \   "app/services/*.rb": {
  \     "command": "service",
  \     "test": "spec/services/%s_spec.rb",
  \     "template": "class %SService \end"
  \   },
  \   "app/workers/*.rb": {
  \     "command": "worker",
  \     "test": "spec/workers/%s_spec.rb",
  \     "template": "class %SWorker \end"
  \   }
  \ }
let g:rails_gem_projections = {
  \   "active_model_serializers": {
  \     "app/serializers/*_serializer.rb": {
  \       "command": "serializer",
  \       "affinity": "model",
  \       "test": "spec/serializers/%s_spec.rb",
  \       "related": "app/models/%s.rb",
  \       "template": "class %SSerializer < ActiveModel::Serializer\nend"
  \     }
  \   },
  \   "draper": {
  \     "app/decorators/*_decorator.rb": {
  \       "command": "decorator",
  \       "affinity": "model",
  \       "test": "spec/decorators/%s_spec.rb",
  \       "related": "app/models/%s.rb",
  \       "template": "class %SDecorator < Draper::Decorator\nend"
  \     }
  \   },
  \ }
