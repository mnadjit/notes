---
alias: Linux Jobs
tags: shell bash zsh job backgroun foreground
---

- run command in the background
```sh
my_command &
```
- get a list of running background jobs
```sh
jobs
```
- move job to background or foreground
```sh
# jobs id 1 (not PID)
fg %1
bg %1
```
- shell alias to run a command in the background and disown it i.e. with closing the terminal the command keeps running
```sh
alias my_alias='bash -c "{ my_command; } &"'
```
