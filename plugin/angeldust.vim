" Comment: some Functions 
" Last Changed:  
" Maintainer: mDrone
" License: 

"curl -F \"file=@MYFILE.JPG\" https://anonfiles.com/api

"stolen somewhere
:function! Wc()
:   let file = bufname("%")
:   exec '!wc -w' file 
:endfunction

"imgur upload
:function! ImgurUpload(arg1)
:   let file = a:arg1
:   exec '!curl -s -F "image=@' .file. '" -F "key=486690f872c678126a2c09a9e196ce1b" https://imgur.com/api/upload.xml'
:endfunction


"Current filename without extension gets disassambled and opens in a new tab
:function! ELFDisassemble()
:   execute "!objdump -D %:r > %:r.dump"
:   execute ":tabnew %:r.dump"
:endfunction

"Insert Header files from current directory
:function! InsertHeader()
:   let list = split(system("echo *.h"))
:   let list_len = len(list)
:   let i = 0
:   while i < list_len
:     ?#include
:     let templist = "#include \"".list[i]."\"\n"
:     put = templist
:     let i += 1
:   endwhile
:endfunction

" helper function to toggle hex mode
:function! ToggleHex()
" hex mode should be considered a read-only operation
" save values for modified and read-only for restoration later,
" and clear the read-only flag for now
:   let l:modified=&mod
:   let l:oldreadonly=&readonly
:   let &readonly=0
:   let l:oldmodifiable=&modifiable
:   let &modifiable=1
:if !exists("b:editHex") || !b:editHex
" save old options
:   let b:oldft=&ft
:   let b:oldbin=&bin
" set new options
:   setlocal binary " make sure it overrides any textwidth, etc.
:   let &ft="xxd"
" set status
:   let b:editHex=1
" switch to hex editor
:   %!xxd
:else
" restore old options
:   let &ft=b:oldft
:if !b:oldbin
:   setlocal nobinary
:endif
" set status
:   let b:editHex=0
" return to normal editing
:   %!xxd -r
:endif
" restore values for modified and read only state
:   let &mod=l:modified
:   let &readonly=l:oldreadonly
:   let &modifiable=l:oldmodifiable
:endfunction
 



" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

command! SprungePaste execute "!cat % | curl -F 'sprunge=<-' http://sprunge.us"
"command! BPaste execute \"!cat % | curl -F 'bp=<-' http://bpaste.net"
command! -nargs=1 ImgurUpload call ImgurUpload(<f-args>)

command! InsertHeader silent! call InsertHeader()

command! ASMCompileLinkGDB execute "!as -ggstab -o ./%:r.o ./% && ld -o ./%:r ./%:r.o && gdb ./%:r"
command! CCompileStripDebugSymbolsRun execute "!make -f ~/makefiles/c -j2 ./%:r && objcopy --only-keep-debug ./%:r ./%:r.dbg && strip --strip-all ./%:r && ./%:r"
command! CCompileStripLinkDebugSymbolsRun execute "!make -f ~/makefiles/c -j2 ./%:r && objcopy --only-keep-debug ./%:r ./%:r.dbg && strip -g ./%:r && objcopy --add-gnu-debuglink=./%:r.dbg ./%:r && ./%:r"
command! ELFDisassemble call ELFDisassemble()

command! Flex execute "!flex -o ./%:r.c ./% && gcc ./%:r.c -o ./%:r -ggdb -l fl && ./%:r"


command! Wget execute "!wget -c -i ./%"
command! WordCount call Wc()
