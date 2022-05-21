function code#Execute()
let saved_unnamed_register = @@

normal! `<v`>y

execute "!ts-node -pe ".shellescape(@@)

let @@ = saved_unnamed_register

endfunction

