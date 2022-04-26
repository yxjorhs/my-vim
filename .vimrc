set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

Plugin 'yxjorhs/my-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Lokaltog/vim-distinguished'

call vundle#end()

colorscheme distinguished "distinguished, evening, morning
filetype plugin indent on
syntax on

set clipboard=unnamedplus
set encoding=utf-8
set hidden
set hlsearch
set incsearch
set laststatus=2
set number
set relativenumber 
set shiftwidth=2
set tabstop=2
set shortmess+=c
set signcolumn=yes
set updatetime=300

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
      \'coc-git',
      \'coc-json',
      \'coc-tsserver',
      \'coc-snippets',
      \]

" mapping
let mapleader = " "

inoremap <silent>jk <Esc>l
vnoremap <silent>jk <Esc>

nnoremap <leader><leader> :

" execute test function
" nnoremap <silent><leader>t :call test#test()<cr>

" save
nnoremap <leader>s :w<cr>

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
nnoremap <silent><leader>bp :bp<cr>
nnoremap <leader>bb :b 

inoremap <silent>{ {<cr>}<Esc>O
inoremap <silent>( ()<Esc>i
inoremap <silent>< <><Esc>i
inoremap <silent>[ []<Esc>i
inoremap <silent>` ``<Esc>i
inoremap <silent>' ''<Esc>i
inoremap <silent>" ""<Esc>i
inoremap <silent>/** /**  */<Esc>hhi

"tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ?
	\ coc#expandableOrJumpable() ?
	  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
	  \ :"\<C-n>"
	\ :<SID>check_back_space() ?
	  \ "\<TAB>"
	  \ :coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" GoTo code navigation.
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)

" show document
nnoremap <silent> <leader>h :call <SID>show_document()<CR>

function! s:show_document()
  if (index(['vim','help'], &filetype)>=0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

