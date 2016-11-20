"nnoremap <ESC> :noh<RETURN><ESC>
"This unsets the "last search pattern" register by hitting return
"nnoremap <CR> :noh<CR><CR>
"nnoremap <ESC> :noh<CR><CR>

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

nnoremap <F10> :Hexmode<CR>
inoremap <F10> <Esc>:Hexmode<CR>
vnoremap <F10> :<C-U>Hexmode<CR>

"vnoremap <C-j> :call Incr()<CR>

:map <F4> :!bf < ./% > ./%:r && chmod +x ./%:r && ./%:r
:map <F5> :!make -f ~/makefiles/c -j2 ./%:r && ./%:r
:map <F6> :!gdb ./%:r
:map <F7> :!valgrind -v --track-origins=yes --leak-check=full ./%:r
:map <F8> :!pdflatex ./% && bibtex ./%:r.aux && pdflatex ./% && evince ./%:r.pdf
:map <F9> :!pandoc -f latex -s -S --toc ./% -o ./%:r.odt 
":map <F9> :!chmod +x ./% && ./%

cnorea Q q
cnorea W w

:map! <F3> <ESC>i/**<CR><SPACE>*<CR>*<CR>*/<ESC>kkA<SPACE>
"inoremap ü (
"inoremap ( ü
"inoremap Ü )
"inoremap ) Ü
"inoremap ö [
"inoremap [ ö
"inoremap Ö ]
"inoremap ] Ö
"inoremap ä {
"inoremap { ä
"inoremap Ä }
"inoremap } Ä
"inoremap ß /
"inoremap / ß
"
"nnoremap ü (
"nnoremap Ü )
"nnoremap ö [
"nnoremap Ö ]
"nnoremap ä {
"nnoremap Ä }
"nnoremap ß /

nnoremap , :

inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
