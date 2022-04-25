set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Lokaltog/vim-distinguished'

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

"Plugin 'yxjorhs/my-vim'
Plugin 'git@github.com:yxjorhs/my-vim.git'

call vundle#end()

colorscheme distinguished
filetype plugin indent on
set clipboard=unnamedplus
set incsearch
set laststatus=2
set number
set relativenumber 
set shiftwidth=2
set hlsearch
set cmdheight=2
syntax on
let g:coc_disable_startup_warning = 1
