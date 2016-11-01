
let s:package = substitute(system("pwd | sed 's:/.*/::g'"), "\n", "", "g")
let s:classpath = '"' . "!echo $CLASSPATH" . '"'

"Create jar file for a package
:function! JJar()
:   let fname = expand("%:r")
:   call MFest()
:   let manifest = s:package . "." . fname . ".MF"
:   execute "!cd .. && javac -cp " . s:classpath . " -g -verbose -Werror " . s:package . "/*.java && jar cmf " . s:package . "/" . manifest . " " . fname . ".jar " . s:package . "/*.class && rm " . s:package . "/*.class " . s:package . "/" . manifest
:endfunction

"Create Manifest file for a package
:function! MFest()
:   let fname = expand("%:r")
:   let manifest = s:package . "." . fname . ".MF"
:   execute "!vim " . manifest
:   let list = join(split(substitute(system("echo lib/*.jar"), "\n", "", "g")))
:   execute "!sed -i.bak '/Main.*$/a\Class-Path: " . list . "' " . manifest
:   execute "!rm " . manifest . ".bak"
:endfunction

"Rename current file and replace every occurance of the filename
:function! JavaClassRename(arg1)
:   let fname = expand("%:r")
:   let fnameEx = expand("%")
:   execute ":w " .a:arg1.".java"
:   execute ":o " .a:arg1.".java"
:   execute ":%s/" .fname. "/" .a:arg1."/g | :w"
:   execute ":!mv " .fnameEx " " .fnameEx.".orig" 
:endfunction

"Create Testcase for java
:function! JavaCreateTC()
:   let fname = expand("%:r")."Test"
:   execute ":tabnew " .fname.".java"
:   execute ":%d"
:   execute ":so ~/.vim/templates/Template.javaTestcase"
:   execute ":%s/Template/" .fname. "/g"
:endfunction

"Compile Testcase for java and run it
:function! JavaCompileNRunTC()
:   let junit = substitute(system('find /usr/share/eclipse -name "*junit.jar" | grep -o ".*4\..*"'), "\n", "", "g")
:   let hamcrest = substitute(system('find /usr/share/eclipse -name "*hamcrest*" | grep -o ".*\.core_.*"'), "\n", "", "g")
:   let fname = expand("%:r")
:   execute "!javac -cp " .junit fname.".java" fname."Test.java && java -cp \"" .junit. ":" .hamcrest. ":./\" org.junit.runner.JUnitCore" fname."Test" 
:endfunction


command! JavaCompile execute "!make -f ~/makefiles/java ./%:r && java %:r"
command! JavaDebug execute "!jdb %:r"
command! JavaJar execute "!make -f ~/makefiles/java %:p:r && vim %:r.MF && jar cmf %:r.MF %:r.jar %:p:h*.class && rm *.class %:r.MF"
command! -nargs=+ JavaClassRename call JavaClassRename(<f-args>) 
command! JavaCreateTC call JavaCreateTC()
command! JJar call JJar()
command! JavaCompileNRunTC call JavaCompileNRunTC()



autocmd bufnewfile *.java so ~/.vim/templates/Template.java
autocmd bufnewfile *.java exe "%s/TempPackage/" . s:package
autocmd bufnewfile *.java exe "%s/Template/" .expand("%:r")
autocmd bufnewfile *.java exe "1," . 8 . "g/File Name     :.*/s//File Name     : " .expand("%")
autocmd bufnewfile *.java exe "1," . 8 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.java execute "normal ma"
autocmd Bufwritepre,filewritepre *.java exe "1," . 8 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.java execute "normal `a"

autocmd bufnewfile *.MF so ~/.vim/templates/Template.MF
autocmd bufnewfile *.MF exe "%s/Template/" . expand("%:r")
autocmd bufnewfile *.MF exe ":wq"
