execute pathogen#infect()
syntax enable

source ~/.vimrc.base

set background=light
colorscheme solarized
set nobackup
set number
set relativenumber
set numberwidth=4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=a
set autoread
set autoindent
set smartindent
filetype plugin indent on
" Trying to respond to Esc faster, see https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=100 ttimeoutlen=0
set wildmenu
set wildmode=longest,list
set wildignorecase
set pastetoggle=<F2>
nnoremap <F3> :set nu!<CR>

" Switch tabs with Alt+Left/Right or Ctrl+h/l
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

" Recursively map the tmux Home button to <Home>, which will be caught
" up by the mapping in .vimrc.base
nmap <Esc>[1~ <Home>
imap <Esc>[1~ <Home>

set clipboard^=unnamedplus

" Set search highlight and its color
hi Search ctermfg='red' guifg='#cb4b16'
set hlsearch

if has('gui_running')
	set guioptions-=T " no toolbar
	set anti enc=utf-8
	set guifont=Ubuntu\ Mono\ Regular\ 13
	set lines=40 columns=100
endif

" Powerline modifiers
set laststatus=2
let g:airline_theme='bubblegum'
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'

let mapleader=" "

nnoremap <F5> :execute pathogen#infect('~/.vim/bundle-manual/{}')<CR>:source ~/.vim/bundle-manual/YouCompleteMe/plugin/youcompleteme.vim<CR>:source ~/.vim/bundle-manual/syntastic/plugin/syntastic.vim<CR>:SyntasticCheck<CR>
" YouCompleteMe settings
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap <Leader>d :YcmCompleter GetDoc<CR>
let g:ycm_complete_in_strings = 0
let g:ycm_autoclose_preview_window_after_completion = 0
" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_autoclose_preview_window_after_insertion = 0
