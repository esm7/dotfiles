" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'oguzbilgic/vim-gdiff'
Plug 'dkarter/bullets.vim'
Plug 'alvan/vim-closetag'

" Syntax
Plug 'mboughaba/i3config.vim'
Plug 'ekalinin/Dockerfile.vim'

" Dev
Plug 'prabirshrestha/async.vim', { 'on': [] }
Plug 'jiangmiao/auto-pairs', { 'on': [] }
Plug 'Vimjas/vim-python-pep8-indent', { 'on': [] }
Plug 'pboettch/vim-highlight-cursor-words', { 'on': [] }
Plug 'Shougo/echodoc.vim', { 'on': [] }
Plug 'pangloss/vim-javascript', { 'on': [] }
Plug 'leafgarland/typescript-vim', { 'on': [] }
Plug 'leafOfTree/vim-svelte-plugin', { 'on': [] }
Plug 'cstrahan/vim-capnp', { 'on': [] }

if has("nvim")
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	set laststatus=3
	tnoremap <Esc> <C-\><C-n>
else
	set laststatus=2
endif

call plug#end()

syntax enable
source ~/.vimrc.base
set background=light
silent! colorscheme solarized
set nocompatible
set nobackup
set noswapfile
set number
set relativenumber
set numberwidth=4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set mouse=a
set autoread
set nosol
" Trying to respond to Esc faster, see https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=150 ttimeoutlen=0
set wildmenu
set wildmode=longest,list
set wildignorecase
set spelllang=en_us
set listchars=tab:>-
set scrolloff=2
" Toggle paste mode
set pastetoggle=<F2>
" Toggle line numbers (i.e. for easy copy over tmux).
" TODO: find a good way to toggle breaks (currently in the first time F3 is used, 
" showbreak is removed)
nnoremap <F3> :set nu! rnu!<CR>:set showbreak=<CR>
" Toggle display of special characters
nnoremap <F4> :set list!<CR>
" Turn off highlight
nnoremap <F9> :nohl<CR>
inoremap <F9> <C-o>:nohl<CR>
" Show by F10 the highlight name
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
			\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
			\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set autoindent
set smartindent
filetype plugin indent on
silent! set breakindent
silent! set showbreak=↳\ 
" Indent Python `func(\n` just one space rather than two
let g:pyindent_open_paren = '&sw'
" Indentation for C comments, see:
" https://www.reddit.com/r/vim/comments/9kz5rk/format_of_c_comments/
au FileType cpp setlocal comments=s1:/*,m:\ ,ex-4:*/,://
set cinoptions=c4N-sg0
au BufNewFile,BufRead *.ejs set filetype=ejs

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.svelte'

" Using autochdir by default, but if dev mode turns on (see below), it will
" turn off
" set autochdir

let g:netrw_liststyle = 1
let g:netrw_timefmt = "%a %Y-%m-%d %T"
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 25
" Open netrw files in previous window
" let g:netrw_browse_split=4
" nnoremap - :Explore<CR>

" Don't abandon buffers when they get hidden, allowing to switch between
" buffers with unsaved changes.
" Ideally we'd just 'set hidden', however this creates an issue with netrw.
" As a workaround, keep 'nohidden', and use an autocmd to set non-netrw
" buffers to hidden: https://github.com/tpope/vim-vinegar/issues/13
set nohidden
augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end

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
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Make ^P select the first entry
" inoremap <expr> <C-p> '<C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
" imap <c-space> <Plug>(asyncomplete_force_refresh)
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Make ^F in insert mode the same as ^X^F and also select the first entry
" inoremap <expr> <C-f> '<C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Map Ctrl+h to the path of the current file when in command mode
cmap <C-h> %:p:h

" Remove the '=' sign from being counted as a file name, because it sometimes 
" interferes with the ability to properly find a file name with ^X^F
set isfname-==

set clipboard^=unnamedplus

" Set search highlight and its color
hi Search ctermfg='red' guifg='#cb4b16'
hi IncSearch ctermfg=DarkMagenta
set hlsearch

hi Type ctermfg=DarkBlue
hi Statement cterm=None
hi Operator cterm=bold
hi Statement cterm=bold
hi MatchParen cterm=underline,bold ctermfg=magenta ctermbg=none
hi SpellBad cterm=underline ctermfg=red
" See https://jonasjacek.github.io/colors/
hi CocWarningHighlight ctermbg=229
hi CocErrorHighlight ctermbg=222
hi CocMenuSel ctermfg='red' ctermbg=white

if has('gui_running')
	set guioptions-=T " no toolbar
	set anti enc=utf-8
	set guifont=Office\ Code\ Pro\ 11
	set lines=40 columns=100
endif

au FileType markdown set wrap linebreak
au FileType markdown set conceallevel=3
au FileType markdown setlocal spell
au FileType markdown set nofoldenable
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType typescript iabbrev imp import { } from '';<Left><Left>

" Note: there is code that turns off spell checking for Markdown in
" ~/.vim/after/syntax/markdown.vim
" (it must be loaded after the syntax file)

" Powerline modifiers
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = ""
let g:airline#extensions#whitespace#checks = [ ]
let g:airline#extensions#tabline#buffer_min_count = 2

let mapleader=" "

" <Leader>g to vimgrep the word under the cursor

" <Leader>f to grep something recursively and case-insensitive, and position
" the cursor where you'd enter text
if executable('rg') && executable('fzf')
	" Make Ripgrep search only the text, not the file name, see https://github.com/junegunn/fzf.vim/issues/346
	command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
	set grepprg=rg\ --vimgrep
	nnoremap <Leader>r :Rg<CR>
	nnoremap <Leader>s :silent grep -i 
	map <Leader>g :silent grep! <cword><CR>:copen<CR>
else
	nnoremap <Leader>s :grep -RIi  *<LEFT><LEFT>
	map <Leader>g :silent grep! <cword> *<CR>:copen<CR>
endif
if executable('fd')
	let $FZF_DEFAULT_COMMAND = 'fd --type f --color=never'
endif
let $FZF_DEFAULT_OPTS = '--bind=tab:toggle+up,btab:toggle+down'
" <Leader>f to run fzf search
map <Leader>f :Files<CR>
map <C-S-n> :Files<CR>
map <Leader>b :Buffers<CR>
" Comment/uncomment line or selection (vim-commentary)
map <Leader>c :Commentary<CR>
map <Leader>q :bd<CR>
map <Leader>w :w<CR>:bd<CR>
" Split
nmap <Leader>= <C-w>s<C-w>w

nnoremap <F5> :source ~/dotfiles/vimrc.dev<CR>

