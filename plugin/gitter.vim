" Comment: git Functions 
" Last Changed:  
" Maintainer: mDrone
" License: 

:let s:guser = "'".substitute(substitute(system('git config --global --get user.name'), "\n", "", "g"), "[A-Z]", "\\L&", "g")."'"

"Create a git repo for the current working directory initialise it
:function! GitRepoCreate()
:   let reponame = substitute(system("pwd | sed 's:/.*/::g'"), "\n", "", "g")
:   let gurl = expand('"').expand('https://github.com/').substitute(s:guser, "'", "", "g").expand("/").reponame.expand('.git"')
:   let gapiurl = expand('"').expand('https://api.github.com/user/repos').expand('"')
:   let settings = expand('"has_issues":true,"has_wiki":true,')
:   let modifier = expand(' -d ').expand("'{").settings.expand('"').expand('name').expand('":').expand('"').reponame.expand('"').expand('}').expand("'")
:   let command = expand('curl -u ')
:   execute "!" . command . s:guser . modifier gapiurl "&& git init && git remote add origin " . gurl "&& git add ./* && git commit -am 'Initial commit' && git push origin master"
:endfunction

"Delete given Repo
:function! GitRepoDelete(arg1)
:   let reponame = a:arg1
:   let gapiurl = expand('"').expand('https://api.github.com/repos/').substitute(s:guser, "'", "", "g").expand("/").reponame.expand('"')
:   let modifier = expand(' -X DELETE ')
:   let command = expand('curl -u ')
:   execute "!" . command . s:guser . modifier . gapiurl 
:endfunction
 
"Rename given Repo with given Name
:function! GitRepoRename(arg1,arg2)
:   let reponame = a:arg1
:   let newrepo = expand("'{").expand('"').expand('name').expand('":"').a:arg2.expand('"}').expand("'")
:   let gapiurl = expand(' "').expand('https://api.github.com/repos/').substitute(s:guser, "'", "", "g").expand("/").reponame.expand('"')
:   let modifier = expand(' -X PATCH -d ').newrepo
:   let command = expand('curl -u ')
:   execute "!" . command . s:guser . modifier . gapiurl 
:endfunction

"Gist post
:function! GistPost()
:   let content = join(getline(1, line('$')), "\n")
:   let command = expand('curl -X POST -d ').expand("'{ \"files\": {\"").expand("%:r").expand('":{"content": "').content.expand("\"}} }' ").expand('https://api.github.com/gists')
:   execute "!" . command
:endfunction

command! GistPost call GistPost()
command! GitRepoCreate call GitRepoCreate() 
command! -nargs=1 GitRepoDelete call GitRepoDelete(<f-args>) 
command! -nargs=+ GitRepoRename call GitRepoRename(<f-args>) 
