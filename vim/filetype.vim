" Added by Nate <nate@mediatemple.net> on 20050606
au BufNewFile,BufRead *.tpl         call FTCheck_ttdwt()
au BufNewFile,BufRead *.tt          call FTCheck_ttdwt()
au BufNewFile,BufRead *.tt2         call FTCheck_ttdwt()
au BufNewFile,BufRead *.tmpl            call FTCheck_ttdwt()
au BufNewFile,BufRead *.mt          call FTCheck_ttdwt()

" Added by Dave <dave@mediatemple.net> on 20060522
fun! FTCheck_ttdwt()
  setf tt2html
  return

  " this was not helping...
  let n = 1
  while n < 100 && n < line("$")
    if getline(n) =~ "\<!-- InstanceBegin template="
      setf dwt
      return
    endif
    let n = n + 1
  endwhile
  setf tt2html
endfun

