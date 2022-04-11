let mapleader = " "

inoremap jk <Esc>l
vnoremap jk <Esc>

" window operate 
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l

" operate mode
onoremap fn :<c-u>normal! 0f(hviw<cr> " function name
