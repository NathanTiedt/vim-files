if has_key(g:polyglot_is_disabled, 'python-compiler')
  finish
endif

" Sometimes Python issues debugging messages
" which don't belong to a call stack context
" this function filters these messages
function! python#utils#fix_qflist() " {{{
  let l:traceback = []
  let l:qflist = getqflist()

  for l:item in l:qflist
    if !empty(l:item.type)
      call add(l:traceback, l:item)
    endif
  endfor

  if !empty(l:traceback)
    call setqflist(l:traceback)
  endif
endfunction " }}}
