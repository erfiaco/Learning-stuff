#GIT Glossary

*For the whole glossary [follow the link!](https://help.github.com/articles/github-glossary/)*

##Git
Git is an open source program for tracking changes in text files.
##Github
It's an online repository
##Commit
A commit, or "revision", is an individual change to a file (or set of files). Every time you save changes to a file Git creates a unique ID (a.k.a. the "SHA" or "hash") that allows you to keep record of what changes were made when and by who. Commits usually contain a commit message which is a brief description of what changes were made.
##Fetch
Fetching refers to getting the latest changes from an online repository (like GitHub.com) without merging them in. Once these changes are fetched you can compare them to your local branches (the code residing on your local machine).
##Markdown
Markdown is an incredibly simple semantic file format, not too dissimilar from .doc, .rtf and .txt. Markdown makes it easy for even those without a web-publishing background to write prose (including with links, lists, bullets, etc.) and have it displayed like a website. GitHub supports Markdown, and you can learn about the semantics.
##Command line interface
Tool that allws you to navigate easily inside directories in your PC is almost the same as bash script or prompt
##Command, flags and arguments
Command is an action to be taken, while flags are parameter after the command, and argument is what the command is going to modify
*pwd: gives me the current directory
*git status
*ls: list files & folders in c.d. ls_a lists also hidden f&f. ls_al list also details. Note a & l are both flags that can be conbined
*cd namefile: changes the directory to the file located inside the cd.
*cd ~/namefile: changes directory to a file located in the parent directory
*mkdir: creates directory
*rm: removes
*git init: initialize folder so we can monitorize changes inside it
*git add filename: starts tracking the file. Once we track it we can stage it to commit.
*git reset filename: To unstage a file, use 'git reset HEAD YOUR-FILE'.
*git add .: Adds all the files in the local repository and stages them for commit.
*git add _n deals with all changes to files deleting or changing names
*git commit -m "message" this updates my local repo and keeps track of intermediate versions.
*git remote add origin server: connects an existing remote repository to the current local repository (the server is written as http://github.com/erfiaco/Learning_stuff.git)
*git remote -v: checks the remote repository connected to the local
*git remote rm destination: note. if i play the latter command it may show me destination and a server: it indicates when my local is a destination repository from a forkk for example
*git remote rm origin: removes the remote from your local. Does not delets the repository from the server.
*date
*echo: prints
*git push origin master: pushed commits to remote
*git add -n stages name changes
*git add -A stages name changes and changes in file contemporary
*git touch new.md: creates a new file