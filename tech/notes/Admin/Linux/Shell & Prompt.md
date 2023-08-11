# Shell
- install zsh
`sudo apt install -y zsh`
- switch to zsh as default shell
`chsh -s $(which zsh)` 
- OR update `/etc/passwd` and change users shell to `/usr/bin/zsh`

# Prompt
Simple prompt with time and colours:
`PROMPT=%F{green}%n%f@%F{green}%m%f $F{blue}%~%f $`

`%n`: username
`%m`: hostname
`%~`: current directory
`%*`: time

## ohmyzsh
- Once zsh is installed you may add **autosuggestions** and **syntax-highlighting** capabilities to zsh using the following commands to download and autoload *ohmyzsh* scripts.
1) Create an installer file e.g. ~/.ohmyzsh_installer
```sh
#!usr/bin/zsh

# prepare the directory
mkdir ~/.ohmyzsh && cd ~/.ohmyzsh

# download auto-suggestions plugin
wget https://raw.githubusercontent.com/zsh-users/zsh-autosuggestions/master/zsh-autosuggestions.zsh --no-check-certificate

# download syntax-highlighting plugin
wget https://raw.githubusercontent.com/zsh-users/zsh-syntax-highlighting/master/zsh-syntax-highlighting.zsh --no-check-certificate
wget https://raw.githubusercontent.com/zsh-users/zsh-syntax-highlighting/master/.version --no-check-certificate
wget https://raw.githubusercontent.com/zsh-users/zsh-syntax-highlighting/master/.revision-hash --no-check-certificate
# apt-get install -y subversion   # for svn to work
svn checkout https://github.com/zsh-users/zsh-syntax-highlighting/trunk/highlighters

# get .zshrc to autoload syntax-highlighting and auto-suggestions plugins
echo -e "\n# load ohmyzsh scripts\nsource ~/.ohmyzsh/zsh-syntax-highlighting.zsh\nsource ~/.ohmyzsh/zsh-autosuggestions.zsh" >> ~/.zshrc
```
2) make the script executable     `chmod u+x ~/.ohmyzsh_installer`
3) run the script       `~/.ohmyzsh_installer`
4) source ~/.zshrc config file for changes to take effect now       `source ~/.zshrc`
