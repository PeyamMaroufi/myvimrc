syntax enable
set number
set ts=4
set autoindent
set shiftwidth=4
set encoding=utf-8
set clipboard=unnamed
set cursorline
set showmatch
let python_highlight_all = 1
call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'sickill/vim-monokai'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf.vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'frazrepo/vim-rainbow'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tell-k/vim-autopep8'
call plug#end() 

" Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

colorscheme monokai

" Fuzzy Finder
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" Floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Rainbow settings
let g:rainbow_active = 1

" Autopep
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" Airline
let g:airline_theme='wombat'

" NERDTree
filetype plugin indent on
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-h>
nmap <F6> :NERDTreeToggle<CR>

" Removing all white spaces
nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Move line up/dowadsa
nnoremap <silent> <M-k> :<C-u>silent! exe "move-2"<CR>==
nnoremap <silent> <M-j> :<C-u>silent! exe "move+1"<CR>==
inoremap <silent> <M-k> <ESC>:<C-u>silent! exe "move-2"<CR>==gi
inoremap <silent> <M-j> <ESC>:<C-u>silent! exe "move+1"<CR>==gi

" Move selected lins up/down
xnoremap <silent> <M-k> :<C-u>silent! exe "'<,'>move-2"<CR>gv=gv
xnoremap <silent> <M-j> :<C-u>silent! exe "'<,'>move'>+"<CR>gv=gv

" Run python code with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Comment code with # and -#
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
