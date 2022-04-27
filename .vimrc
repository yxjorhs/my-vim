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
nnoremap <leader>r <c-r>
" format select code"
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)


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
inoremap <silent>/* /**  */<Esc>hhi

"tab
inoremap <silent><expr> <TAB> <SID>tab_exec()
function s:tab_exec()
	if pumvisible()
		return coc#_select_confirm()
	endif

	" copy form coc-snippets, but it doesn't seem necessary
	"	if coc#expandableOrJumpable()
	"		return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
	"	endif

	if <SID>check_back_space()
		return "\<TAB>"
	endif

	return coc#refresh()
endfunction

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
" goto complete error
nmap <silent><leader>ge <Plug>(coc-diagnostic-next)
" goto browser
vmap <silent><leader>gb <Plug>(openbrowser-smart-search)

" show document
nnoremap <silent><leader>h :call <SID>show_document()<CR>
vnoremap <silent><leader>h :call <SID>show_document()<CR>

function! s:show_document()
  if (index(['vim','help'], &filetype)>=0)
    execute 'h '.expand('<cword>')
		return
	endif
	call CocAction('doHover')
endfunction

