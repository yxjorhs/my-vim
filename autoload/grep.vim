function! grep#grep()
  let word = expand('<cword>')
  let suf = split(expand('%'), '\.')[-1]
  silent execute 'grep '.word.' ./*.'.suf.' ./**/*.'.suf
  execute 'redraw!'
  execute 'cwindow'
endfunction
