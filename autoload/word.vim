function word#Replace() 
  let old = util#GetSelectStr()
  let new = input('replace "'.old.'" to: ')
  execute '%s/'.old.'/'.new.'/g'
endfunction

