execute pathogen#infect()
syntax enable

source ~/.vimrc.base

set background=light
colorscheme solarized
set nobackup
set number
set numberwidth=4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=a
set autoread
set smartindent
" Trying to respond to Esc faster, see https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=0 ttimeoutlen=0
set wildmenu
set wildmode=longest,list
set wildignorecase
set pastetoggle=<F2>

nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>
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
	set guifont=Monospace\ Regular\ 11
	set lines=40 columns=100
endif

" Powerline modifiers
set laststatus=2
let g:airline_theme='bubblegum'
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
