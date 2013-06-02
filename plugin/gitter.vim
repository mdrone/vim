" Comment: git Functions 
" Last Changed:  
" Maintainer: mDrone
" License: 

"Create a git repo for the current working directory initialise it
:function! GitRepoCreate()
:   let reponame = substitute(system("pwd | sed 's:/.*/::g'"), "[^a-zA-Z0-9]", "", "g")
:   let guser = "'".substitute(substitute(system('git config --global --get user.name'), "[^a-zA-Z0-9]", "", "g"), "[A-Z]", "\\L&", "g")."'"
:   let gurl = expand('"').expand('https://github.com/').substitute(guser, "'", "", "g").expand("/").reponame.expand('.git"')
:   let gapiurl = expand('"').expand('https://api.github.com/user/repos').expand('"')
:   let settings = expand('"has_issues":true,"has_wiki":true,')
:   let modifier = expand(' -d ').expand("'{").settings.expand('"').expand('name').expand('":').expand('"').reponame.expand('"').expand('}').expand("'")
:   let command = expand('curl -u ')
:   execute "!" . command . guser . modifier gapiurl "&& git init && git remote add origin " . gurl "&& git add ./* && git commit -am 'Initial commit' && git push origin master"
:endfunction

"Delete given Repo
:function! GitRepoDelete(arg1)
:   let reponame = a:arg1
:   let guser = "'".substitute(substitute(system('git config --global --get user.name'), "[^a-zA-Z0-9]", "", "g"), "[A-Z]", "\\L&", "g")."'"
:   let gapiurl = expand('"').expand('https://api.github.com/repos/').substitute(guser, "'", "", "g").expand("/").reponame.expand('"')
:   let modifier = expand(' -X DELETE ')
:   let command = expand('curl -u ')
:   execute "!" . command . guser . modifier . gapiurl 
:endfunction
 
"Rename given Repo with given Name
:function! GitRepoRename(arg1,arg2)
:   let reponame = a:arg1
:   let newrepo = expand("'{").expand('"').expand('name').expand('":"').a:arg2.expand('"}').expand("'")
:   let guser = "'".substitute(substitute(system('git config --global --get user.name'), "[^a-zA-Z0-9]", "", "g"), "[A-Z]", "\\L&", "g")."'"
:   let gapiurl = expand(' "').expand('https://api.github.com/repos/').substitute(guser, "'", "", "g").expand("/").reponame.expand('"')
:   let modifier = expand(' -X PATCH -d ').newrepo
:   let command = expand('curl -u ')
:   execute "!" . command . guser . modifier . gapiurl 
:endfunction


command! GitRepoCreate call GitRepoCreate() 
command! -nargs=1 GitRepoDelete call GitRepoDelete(<f-args>) 
command! -nargs=+ GitRepoRename call GitRepoRename(<f-args>) 
