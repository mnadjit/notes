```sh
git clone $git_url

git add --all # add all files recursively
git commit -m $message # commit with a message
git push --all # push all tracked files to remote

git remote  -v # get what urls have been set for this repo

git reset --hard origin/main # remove any untracked files
git pull --force # pull repo from remove 

git clean -xdf # remove x(ignored) d(directories) f(files) from repo

git stash
git pull
git stash pop

git rm -r --cached $file_or_dir # to ignore a file or directory after git has already been initiated
```
