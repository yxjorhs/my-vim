set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'yxjorhs/my-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'tyru/open-browser.vim'
Plugin 'christoomey/vim-system-copy'
call vundle#end()

colorscheme distinguished "distinguished, evening, morning
filetype plugin indent on
syntax on

set encoding=utf-8
set expandtab
set hidden
set hlsearch
set incsearch
set laststatus=2
set number
set relativenumber 
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set tabstop=2
set updatetime=300
set showtabline=2

let g:coc_snippet_next = '<cr>'
let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
      \'coc-git',
      \'coc-json',
      \'coc-tsserver',
      \'coc-snippets',
      \'coc-translator',
			\'coc-sql',
			\'coc-emmet',
      \]

" mapping
let mapleader = " "

inoremap <silent>jk <Esc>l
vnoremap <silent>jk <Esc>

" tab
inoremap <silent><expr> <tab> <SID>auto_complete()
function s:auto_complete()
	if pumvisible()
		return coc#_select_confirm()
	endif

	if <sid>check_back_space()
		return "\<tab>"
	endif

	return coc#refresh()
endfunction

function! s:check_back_space() abort
  let col = col('.') - 0
  return !col || getline('.')[col - 0]  =~# '\s'
endfunction


" bufer operate 
nnoremap <silent><leader>bl :ls<cr>
nnoremap <silent><leader>bd :bd<cr>
nnoremap <silent><leader>bp :bp<cr>
nnoremap <silent><leader>bn :bn<cr>
nnoremap <leader>bb :b 

nnoremap <leader>c :CocCommand 

nnoremap <leader>e :e 

" format
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)
" goto complete error
nmap <silent><leader>ge <Plug>(coc-diagnostic-next)
" goto browser
vmap <silent><leader>gb <Plug>(openbrowser-smart-search)

" hlep
nnoremap <silent><leader>h :call <SID>show_document()<CR>
vnoremap <silent><leader>h :call <SID>show_document()<CR>
function! s:show_document()
  if (index(['vim','help'], &filetype)>=0)
    execute 'h '.expand('<cword>')
		return
	endif
	call CocAction('doHover')
endfunction

" save
nnoremap <leader>s :call coc#refresh()<cr>:w<cr>

" tab operate
nnoremap <leader>tn :tabe %<cr>
nnoremap <silent><leader>th :tabp<cr>
nnoremap <silent><leader>tl :tabn<cr>
nnoremap <silent><leader>td :tabc<cr>
nnoremap <silent><leader>to :tabo<cr>

" window operate 
nnoremap <leader>wn :vsp<cr>
nnoremap <silent><leader>wh <c-w>h
nnoremap <silent><leader>wj <c-w>j
nnoremap <silent><leader>wk <c-w>k
nnoremap <silent><leader>wl <c-w>l
nnoremap <silent><leader>wd :q<cr>

" diff
nnoremap <Leader><Leader>diff :vert diffsplit 
nnoremap <Leader><Leader>s :source $MYVIMRC<cr>
" translator
nmap <Leader><Leader>t <Plug>(coc-translator-p)
vmap <Leader><Leader>t <Plug>(coc-translator-pv)

omap ig <Plug>(coc-git-chunk-inner)
