syntax enable
set number
set ts=4
set autoindent
set shiftwidth=4
set encoding=utf-8
set clipboard=unnamed
set cursorline
set cursorline
set cursorline
set showmatch
let python_highlight_all = 1
call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
	Plug 'ycm-core/YouCompleteMe'
	Plug 'sickill/vim-monokai'
	Plug 'jmcantrell/vim-virtualenv'
call plug#end()
filetype plugin indent on
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-h>
nnoremap <C-J> <C-W><C-J>
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
 " Move line up/down
execute "set <M-k>=\ek"
execute "set <M-j>=\ej"
nnoremap <silent> <M-k> :<C-u>silent! exe "move-2"<CR>==
nnoremap <silent> <M-j> :<C-u>silent! exe "move+1"<CR>==
inoremap <silent> <M-k> <ESC>:<C-u>silent! exe "move-2"<CR>==gi
inoremap <silent> <M-j> <ESC>:<C-u>silent! exe "move+1"<CR>==gi
xnoremap <silent> <M-k> :<C-u>silent! exe "'<,'>move-2"<CR>gv=gv
xnoremap <silent> <M-j> :<C-u>silent! exe "'<,'>move'>+"<CR>gv=gv
