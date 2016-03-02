execute pathogen#infect()
syntax enable

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

" Universal part, also applies to .ideavimrc
set incsearch
set ignorecase
nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>
nnoremap <M-S-Up> <C-W><Up>
nnoremap <M-S-Down> <C-W><Down>
nnoremap <M-S-Left> <C-W><Left>
nnoremap <M-S-Right> <C-W><Right>
nnoremap <C-S-Down> <C-E>
set clipboard^=unnamedplus

" Powerline modifiers
set laststatus=2
let g:airline_theme='bubblegum'
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
