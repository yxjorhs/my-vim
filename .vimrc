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
      \]

" mapping
let mapleader = " "

inoremap <silent>jk <Esc>l
vnoremap <silent>jk <Esc>

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

nnoremap <leader>cc :CocCommand<cr>
nnoremap <leader>cl :CocList<cr>

nnoremap <leader>e :e 
" open config
nnoremap <Leader><Leader>es :e ~/.vim/bundle/my-vim/snippets<cr>
nnoremap <Leader><Leader>ev :e $MYVIMRC<cr>

" find
nnoremap <leader>f /
vnoremap <leader>f :<c-u>execute '/'.expand('<cword>')<CR>
" format
vmap <leader><leader>f <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent><leader>gd mT:<C-u>call CocActionAsync('jumpDefinition')<CR>
nmap <silent><leader>gr mT:<C-u>call CocActionAsync('jumpReferences')<CR>
" goto complete error
nmap <silent><leader>ge <Plug>(coc-diagnostic-next)
" go back
nnoremap <silent><leader>gb `T
" git
nnoremap <tab>gs :!clear
      \&& pwd
      \&& git status<cr>
nnoremap <tab>ga :w<cr>
      \:execute '!clear && pwd && git add '.expand('%')<cr>
      \:CocCommand git.refresh<cr>
nnoremap <tab>gc :!git commit -m ''<LEFT>
nnoremap <tab>gp :!git push<cr>

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

nnoremap <leader>j :call Scroll(0)<cr>
nnoremap <leader>k :call Scroll(1)<cr>
function Scroll(up)
  if a:up
    let scrollaction="\<c-y>"
  else
    let scrollaction="\<c-e>"
  endif

  let counter=1
  while counter<&scroll * 1
    let counter+=1
    exec "normal! " . scrollaction
    redraw
    exec "sleep 15m"
  endwhile
endfunction

nnoremap <silent><leader>q :q<cr>

" replace
vnoremap <leader>r :<c-u>execute '%s/'.expand('<cword>').'//g'<LEFT><LEFT><LEFT>

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
nnoremap <silent><leader><leader>w :vsp<cr>

