---
aliases: Ruby Installation
tags: ruby install
author: Mehdi N Tehrani
creat_date: 2023-10-27
category: Development
subcategory: Ruby
---

# Windows
## References
[Install on Ubuntu / WSL / Windows 11](https://gorails.com/setup/windows/11#ruby)

## Install 
### Ruby
```sh
# Install Ubuntu on WSL
wsl --install ubuntu

# Install prerequisites
sudo apt-get update 
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

# Install asdf version manager
cd 
git clone https://github.com/excid3/asdf.git ~/.asdf
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
echo 'legacy_version_file = yes' >> ~/.asdfrc
echo 'export EDITOR="code --wait"' >> ~/.bashrc exec $SHELL

# Add required asdf plugins
asdf plugin add ruby
asdf plugin add nodejs

# Install Ruby
asdf install ruby <version>
asdf global ruby <version>

# Confirm successful installation
which ruby
ruby -v

# Install nodejs for handling javascript in ruby projects
asdf install nodejs <version>
asdf global nodejs <version>

# Confirm successful installation
which node
node -v

# Install yarn for Rails jsbundling/cssbundling or webpacker 
npm install -g yarn
```
### Rails
```sh
# install rails
gem install rails -v <version>

# confirm installation
rails -v
```
### Postgres SQL
This can be installed on OS or on docker
