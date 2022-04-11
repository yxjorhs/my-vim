let mapleader = " "

inoremap jk <Esc>l
vnoremap jk <Esc>

nnoremap <space><space> :

" window operate 
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l

nnoremap <leader>g :set operatorfunc=mapping#grep<cr>g@
vnoremap <leader>g :<c-u>call mapping#grep(visualmode())<cr>

" operate mode
onoremap fn :<c-u>normal! 0f(hviw<cr> " function name
