function scroll#Move(up)
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
    exec "sleep 10m"
  endwhile
endfunction

