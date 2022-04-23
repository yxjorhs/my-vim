function! test#test()
  let word = expand('<cword>')
  let suf = split(expand('%'), '\.')[-1]
  silent execute 'grep '.word.' ./*.'.suf.' ./**/*.'.suf
  execute 'redraw!'
endfunction

" menu testing"
menu ]Example.item1\ item1	:echo 1
menu ]Example.item1\ item2	:echo '1-2'
menu ]Example.item2	:echo 2

nnoremap <leader>p :popup Example<cr>

