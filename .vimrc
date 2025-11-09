nnoremap <C-k> 20k
nnoremap <C-j> 20j
vnoremap <C-k> 20k
vnoremap <C-j> 20j

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Copy to system clipboard with Ctrl+y
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" Paste from system clipboard with Ctrl+p
nnoremap <C-p> "+p
vnoremap <C-p> "+p
inoremap <C-p> <C-r>+

:set relativenumber
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set hlsearch
set scrolloff=4
