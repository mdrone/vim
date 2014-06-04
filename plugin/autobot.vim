
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Restore Curser Position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

autocmd bufnewfile *.b source ~/.vim/templates/Template.b

autocmd bufnewfile *.s source ~/.vim/templates/Template.s

au BufNewFile,BufRead,BufEnter *.tex setlocal spell spelllang=de_de
au BufNewFile,BufRead,BufEnter *en.tex setlocal spell spelllang=en_us
"au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_en
autocmd bufnewfile *doc.tex so ~/.vim/templates/Template.tex
autocmd bufnewfile *pres.tex so ~/.vim/templates/TemplatePresentation.tex
autocmd bufnewfile *.tex exe "1," . 8 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.tex exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.tex execute "normal ma"
autocmd Bufwritepre,filewritepre *.tex exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.tex execute "normal `a"


autocmd bufnewfile Makefile so ~/.vim/templates/Template.Make

autocmd bufnewfile *.h so ~/.vim/templates/Template.h
autocmd bufnewfile *.h exe "%s/Template/" .expand("%:r")

autocmd bufnewfile *.c so ~/.vim/templates/Template.c
autocmd bufnewfile *.c exe "1," . 8 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.c exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd bufnewfile *.c silent! exe InsertHeader()
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"
"autocmd bufwritepost,filewritepost *.c execute \"!indent -orig ./%"

autocmd bufnewfile *.lxi so ~/.vim/templates/Template.lxi
autocmd bufnewfile *.lxi exe "1," . 8 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.lxi exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.lxi execute "normal ma"
autocmd Bufwritepre,filewritepre *.lxi exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.lxi execute "normal `a"

autocmd BufReadPre *.pdf set ro nowrap
autocmd BufReadPost *.pdf silent %!pdftotext "%" -nopgbrk -layout -q -eol unix -
autocmd BufWritePost *.pdf silent !rm -rf ~/PDF/%
autocmd BufWritePost *.pdf silent !lp -s -d pdffg "%"
autocmd BufWritePost *.pdf silent !until [ -e ~/PDF/% ]; do sleep 1; done
autocmd BufWritePost *.pdf silent !mv ~/PDF/% %:p:h

autocmd BufRead /tmp/mutt-* set tw=72
