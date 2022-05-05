inoremap <buffer><silent>{ {}<Esc>i
inoremap <buffer><silent>( ()<Esc>i
inoremap <buffer><silent>[ []<Esc>i
inoremap <buffer><silent>` ``<Esc>i
inoremap <buffer><silent>' ''<Esc>i
inoremap <buffer><silent>" ""<Esc>i
inoremap <buffer><silent>/* /**  */<Esc>hhi

inoremap <buffer><silent><expr><cr> <SID>cr_exec()
function s:cr_exec()
  let col = col('.') - 1

  if getline('.')[col] == "}" || getline('.')[col] == "]" || getline('.')[col] == ")"
    return "\<cr>\<Esc>\O"
  endif

  return "\<cr>"
endfunction
