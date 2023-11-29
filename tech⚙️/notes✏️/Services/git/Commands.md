---
aliases: Git Command
tags: 
- tech
- git
- commands
author: Mehdi N Tehrani
creat_date: 2023-11-16
category: Tech
subcategory: Dev Git
---

# Common
```sh
git clone $git_url

git add --all # add all files recursively
git commit -m $message # commit with a message
git push --all # push all tracked files to remote

git remote  -v # get what urls have been set for this repo

git reset --hard origin/main # remove any untracked files
git pull --force # pull repo from remove 

git clean -xdf # remove x(ignored) d(directories) f(files) from repo
```

# Stash
#stash
```
git stash
git pull
git stash pop
```
# Remove file from git cache
```
git rm -r --cached $file_or_dir # to ignore a file or directory after git has already been initiated
```
# Log
#log
```
# show logs in one line and show branching graphically
git log --graph --decorate --oneline

# Search log for a string
git log -S <string>
```
## Reflog
#reflog
Git uses the git reflog tool to keep track of changes made to branch tips
`git reflog`

# Branch
#branch
```
git branch -vv
```

# Prune
#prune
```
# remove references to remote repo if branch no longer exists in remote repo 
git remote update --prune

# delete local branch which doesn't exist in remote repo
git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
```

# Bisect
#bisect
Binary search to find where a certain change was introduced
```
git bisect start
git bisect bad [<commit>]
git bisect good [<commit>]
```