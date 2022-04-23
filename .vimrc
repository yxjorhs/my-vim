set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'leafgarland/typescript-vim'

"Plugin 'yxjorhs/my-vim'
Plugin 'git@github.com:yxjorhs/my-vim.git'

Plugin 'Lokaltog/vim-distinguished'

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
syntax on
