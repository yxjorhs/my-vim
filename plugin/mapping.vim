let mapleader = " "

inoremap <silent>jk <Esc>l
vnoremap <silent>jk <Esc>

nnoremap <silent><leader><leader> :

" execute test function
nnoremap <silent><leader>t :call test#test()<cr>

" save
nnoremap <silent><leader>s :w<cr>

" go to cmd
nnoremap <silent><leader>c :!

" window operate 
nnoremap <silent><leader>wh <c-w>h
nnoremap <silent><leader>wj <c-w>j
nnoremap <silent><leader>wk <c-w>k
nnoremap <silent><leader>wl <c-w>l
nnoremap <silent><leader>wd :q<cr>
nnoremap <silent><leader>wn :vsp<cr>

" bufer operate 
nnoremap <silent><leader>bl :ls<cr>
nnoremap <silent><leader>bd :bd<cr>
nnoremap <silent><leader>bn :bn<cr>

" grep
nnoremap <silent><leader>g :call grep#grep()<cr>

inoremap <silent>{ {<cr>}<Esc>O
inoremap <silent>( ()<Esc>i
inoremap <silent>< <><Esc>i
inoremap <silent>[ []<Esc>i
inoremap <silent>' ''<Esc>i
inoremap <silent>" ""<Esc>i
inoremap <silent>/** /**  */<Esc>hhi

