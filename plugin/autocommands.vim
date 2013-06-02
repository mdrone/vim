
autocmd bufnewfile *.b source ~/.vim/templates/Template.b

autocmd bufnewfile *.tex so ~/.vim/templates/Template.tex
autocmd bufnewfile *.tex exe "1," . 8 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.tex exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.tex execute "normal ma"
autocmd Bufwritepre,filewritepre *.tex exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.tex execute "normal `a"

autocmd bufnewfile *.java so ~/.vim/templates/Template.java
autocmd bufnewfile *.java exe "%s/Template/" .expand("%:r")
autocmd bufnewfile *.java exe "1," . 8 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.java exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.java execute "normal ma"
autocmd Bufwritepre,filewritepre *.java exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.java execute "normal `a"

autocmd bufnewfile *.MF so ~/.vim/templates/Template.MF
autocmd bufnewfile *.MF exe "%s/Template/" .expand("%:r")
autocmd bufnewfile *.MF exe ":wq"

autocmd bufnewfile *.c so ~/.vim/templates/Template.c
autocmd bufnewfile *.c exe "1," . 8 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.c exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

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

"autocmd BufWritePost ~/.vimrc :source %

autocmd BufRead /tmp/mutt-* set tw=72
