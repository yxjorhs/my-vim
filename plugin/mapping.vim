let mapleader = " "

inoremap jk <Esc>l
vnoremap jk <Esc>

nnoremap <leader><leader> :

" execute test function
nnoremap <leader>t :call test#test()<cr>

" save
nnoremap <leader>s :w<cr>
nnoremap <leader>ss :w<cr>:source %<cr>

" go to cmd
nnoremap <leader>c :!

" window operate 
nnoremap <leader>wh <c-w>h
nnoremap <leader>wj <c-w>j
nnoremap <leader>wk <c-w>k
nnoremap <leader>wl <c-w>l
nnoremap <leader>wd :q<cr>
nnoremap <leader>wn :vsp<cr>

" bufer operate 
nnoremap <leader>bl :ls<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" grep
nnoremap <leader>g :call grep#grep()<cr>

inoremap { {<cr>}<Esc>O
inoremap ( ()<Esc>i
inoremap < <><Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap /** /**  */<Esc>hhi

