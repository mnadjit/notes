---
aliases: Rails Development Environment 
tags: rails environment_variables credentials
author: Mehdi N Tehrani
creat_date: 2023-10-27
category: Development
subcategory: Rails
---

# References


# Bundler
[GitHub](https://stackoverflow.com/questions/6588674/what-does-bundle-exec-rake-mean)
[Bundler](https://bundler.io/)

In some cases, running executables without `bundle exec` may work, if the executable happens to be installed in your system and does not pull in any gems that conflict with your bundle. However, this is unreliable and is the source of considerable pain. Even if it looks like it works, it may not work in the future or on another machine.

# Database
`bundle exec db:create`
`bundle exec db:migrate`
`bundle exec db:rollback`

# Rail Server
`rail server`
	- shorthand: `rail s`
`rail test`
	- shorthand `rail t`

# Troubleshooting
- [!] Error: tailwind.css not found in the load path
- [x] Solution: `bundle exec assets:precompile` 
