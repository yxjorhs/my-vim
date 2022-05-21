function util#GetSelectStr()
  let saved_unnamed_register = @@

  normal! `<v`>y

  let ret = @@

  let @@ = saved_unnamed_register

  return ret
endfunction

