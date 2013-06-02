
:map <F4> :!bf < ./% > ./%:r && chmod +x ./%:r && ./%:r
:map <F5> :!make -f ~/makefiles/c -j2 ./%:r && ./%:r
:map <F6> :!gdb ./%:r
:map <F7> :!valgrind -v --track-origins=yes --leak-check=full ./%:r
:map <F8> :!pdflatex ./% && evince ./%:r.pdf
:map <F9> :!chmod +x ./% && ./%


cnorea Q q
cnorea W w

:map! <F3> <ESC>i/**<CR><BS>* <CR>*<CR>*/<ESC>kkA
:map! ü (
:map! Ü )
:map! ö [
:map! ä ]
:map! Ö {
:map! Ä }
:map! ß /

inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>
