if v:version < 800
	execute pathogen#infect()
endif
syntax enable

source ~/.vimrc.base
source ~/.vimrc.netrw

set background=light
colorscheme solarized
set nocompatible
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
set timeoutlen=150 ttimeoutlen=0
set wildmenu
set wildmode=longest,list
set wildignorecase
set pastetoggle=<F2>
nnoremap <F3> :set nu! rnu!<CR>
nnoremap <F9> :nohl<CR>
inoremap <F9> <C-o>:nohl<CR>
nnoremap <F12> :call SexToggle()<CR>

" Using autochdir by default, but if dev mode turns on (see below), it will
" turn off
" set autochdir

" Workaround for a netrw bug with autochdir, see:
" https://github.com/tpope/vim-vinegar/issues/13
" autocmd FileType netrw setl bufhidden=delete
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 25
" Open netrw files in previous window
" let g:netrw_browse_split=4


" Don't abandon buffers when they get hidden, allowing to switch between
" buffers with unsaved changes
set hidden
" Switch buffers with Ctrl+Left/Right or Ctrl+h/l
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>

set rtp+=~/.fzf

" Recursively map the tmux Home button to <Home>, which will be caught
" up by the mapping in .vimrc.base
nmap <Esc>[1~ <Home>
imap <Esc>[1~ <Home>

" Completion menu options. Source for some of them:
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" Make completion menus accept the longest matching string
set completeopt=longest,menuone
" Make Enter accept the selected entry in a completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Make ^P select the first entry
" inoremap <expr> <C-p> '<C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Make ^F in insert mode the same as ^X^F and also select the first entry
inoremap <expr> <C-f> '<C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" Remove the '=' sign from being counted as a file name, because it sometimes 
" interferes with the ability to properly find a file name with ^X^F
set isfname-==

set clipboard^=unnamedplus

" Set search highlight and its color
hi Search ctermfg='red' guifg='#cb4b16'
set hlsearch

if has('gui_running')
	set guioptions-=T " no toolbar
	set anti enc=utf-8
	set guifont=Office\ Code\ Pro\ 11
	set lines=40 columns=100
endif

au FileType markdown set wrap linebreak
au FileType markdown set conceallevel=3
au FileType markdown setlocal spell

" Powerline modifiers
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = ""
let g:airline#extensions#whitespace#checks = [ ]
let g:airline#extensions#tabline#buffer_min_count = 2

let mapleader=" "

" <Leader>g to vimgrep the word under the cursor
map <Leader>g :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **/*"<Bar>:copen
" <Leader>f to run fzf search
map <Leader>f :Files<CR>
map <C-S-n> :Files<CR>
map <Leader>b :Buffers<CR>
" Comment/uncomment line or selection (vim-commentary)
map <Leader>c :Commentary<CR>
map <Leader>q :bd<CR>

nnoremap <F5> :source ~/dotfiles/vimrc.dev<CR>

