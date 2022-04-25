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

colorscheme distinguished
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
set shortmess+=c
set signcolumn=yes
set updatetime=300

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [
      \'coc-git',
      \'coc-json',
      \'coc-tsserver',
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

inoremap <silent>{ {<cr>}<Esc>O
inoremap <silent>( ()<Esc>i
inoremap <silent>< <><Esc>i
inoremap <silent>[ []<Esc>i
inoremap <silent>' ''<Esc>i
inoremap <silent>" ""<Esc>i
inoremap <silent>/** /**  */<Esc>hhi

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
