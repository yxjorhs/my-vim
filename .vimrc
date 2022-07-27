set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'yxjorhs/my-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'morhetz/gruvbox'
Plugin 'tyru/open-browser.vim'
Plugin 'christoomey/vim-system-copy'
call vundle#end()

filetype plugin indent on
syntax on

set background=light "dark, light
colorscheme gruvbox "distinguished, evening, morning

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
" set fdm=indent

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
      \'coc-explorer',
      \]

" mapping
let mapleader = " "

inoremap <silent>jk <Esc>l
vnoremap <silent>jk <Esc>

inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap ` ``<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap <c-j> <DOWN>
inoremap <c-k> <UP>

" tab
inoremap <silent><expr><tab> <SID>auto_complete()
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

" mapping
nnoremap <leader>b :b 

nnoremap <leader>c :!clear && 
vmap <Leader><Leader>ce <Plug>(yxjorhs-code-execute)

nnoremap <leader>e :e 
" open config
nnoremap <Leader><Leader>em :e ~/.vim/bundle/my-vim/<cr>
nnoremap <Leader><Leader>ec :e ~/.vim/coc-settings.json<cr>
nnoremap <Leader><Leader>ev :e $MYVIMRC<cr>
nnoremap <tab>e <Cmd>CocCommand explorer<CR> 

" find
nnoremap <leader>f /
vnoremap <leader>f :<c-u>execute '/'.expand('<cword>')<CR>
" format
vmap <leader><leader>f <Plug>(coc-format-selected)
nmap <leader><leader>f <Plug>(coc-format-selected)

nmap <silent><leader>gd mT:<C-u>call CocActionAsync('jumpDefinition')<CR>
nmap <silent><leader>gr mT:<C-u>call CocActionAsync('jumpReferences')<CR>
nmap <silent><leader>ge <Plug>(coc-diagnostic-next)
nnoremap <silent><leader>gb `T
nnoremap <silent><tab>gs :CocCommand git.showCommit<cr>
nnoremap <silent><tab>gf :CocCommand git.foldUnchanged<cr>

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

nmap <leader>j <Plug>(yxjorhs-scroll-down)
nmap <leader>k <Plug>(yxjorhs-scroll-up)

nnoremap <silent><leader>q :q<cr>

vnoremap <leader>r <Plug>(yxjorhs-word-replace)

" save
nnoremap <leader>s 
      \:call coc#refresh()<cr>
      \:w<cr>
" refresh vimrc
nnoremap <Leader><Leader>s :source $MYVIMRC<cr>

" tab operate
nnoremap <silent><leader>t :tabn<cr>
nnoremap <silent><leader><leader>t :tabe %<cr>
" translator
nmap <silent><tab>t <Plug>(coc-translator-p)
vmap <silent><tab>t <Plug>(coc-translator-pv)

" window operate 
nnoremap <silent><leader>w <c-w><c-w>
nnoremap <silent><leader><leader>w :vsp<cr><c-w><c-w>

