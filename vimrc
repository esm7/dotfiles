execute pathogen#infect()
syntax enable
set background=light
colorscheme solarized
set nobackup
set incsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=a
nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>
set clipboard^=unnamedplus
" Don't clear the clipboard on exit
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")
" Always show the statusbar
set laststatus=2

