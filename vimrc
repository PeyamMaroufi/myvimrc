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
	Plug 'dense-analysis/ale'
	Plug 'vim-airline/vim-airline'
call plug#end() 
let g:ale_linters = {
			\ 'python': ['flake8', 'pylint']
			\}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

colorscheme monokai
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
.vimrc
