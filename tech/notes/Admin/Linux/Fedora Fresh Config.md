```sh
#!/bin/bash

# Update the repository list of packages
sudo dnf update -y
sudo dnf upgrade -y

# uncomment the partner repositories to have access to 3rd party packages
#sudo sed -i 's/# deb http:\/\/archive.canonical.com/deb http:\/\/archive.canonical.com/; s/# deb-src http:\/\/archive.canonical.com/deb-src http:\/\/archive.canonical.com/' /etc/apt/sources.list

# Add RPM Fusion Free Repository
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Add RPM Fusion Non-Free Repository
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Install Packages 
# curl: to access online resources, net-tools & terminator terminal
# flatpak: standalone applications e.g. spotify, teams, etc.
# dnfdragora: an enhanced package manager; can be used to install single packages, not necessarily as part of an application
# Neofetch:
# bpytop:
# ncdu: 
# mc:
# marker
# Networking Tools: 
#    nmap:
#    wireshark:
sudo dnf install wget curl python3 flatpak dnfdragora neofetch bpytop ncdu mc net-tools wireshark nmap marker


#--------------------------------------------
# Flatpaks
#--------------------------------------------
# Add Flathub repo if doesn't exist - Fedora 36 gives the option for this at initial config
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install flatpaks
flatpak install -y flathub com.visualstudio.code
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y com.microsoft.teams
flatpak install -y com.spotify.client
flatpak install -y flathub org.pulseaudio.pavucontrol
#--------------------------------------------

#--------------------------------------------
# Docker
#--------------------------------------------
# Install the dnf-plugins-core package (which provides the commands to manage your DNF repositories) and set up the stable repository. This is needed for docker installation.
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Install Virtualization packages
sudo dnf groupinstall --with-optional virtualization

# Install Development Tools
sudo dnf groupinstall "Development Tools"

# Add media codecs that are not shiped with fedora
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# Install zsh to replace bash shell
sudo apt install -y net-tools terminator flatpak synaptic ubuntu-restricted-extrais zsh bpytop neofetch

# Make zsh the default shell
chsh -s $(which zsh)

# Make terminator the default terminal
sudo sudo update-alternatives --config x-terminal-emulator

#--------------------------------------------
# Citrix Client
#--------------------------------------------
# Install Citrix ICAClient (Citrix Workspace)
dnf localinstall $(curl -fsSL "https://downloads.citrix.com/20976/ICAClient-rhel-22.5.0.16-0.x86_64.rpm?__gda__=exp=1652810187~acl=/*~hmac=86dbd1a797d91ebd17d6a931d2a52657f2f9ec57993728b739d8329599b9ebd0")
                        
#--------------------------------------------
# Add Required Certificates needed to connect 
# to FollowMeDesktop.nh.org.au 
#--------------------------------------------
sudo echo -n | openssl s_client -connect followmedesktop.nh.org.au:443 | awk '/BEGIN/ {i++;} /BEGIN/, /END/ { print > "/opt/Citrix/ICAClient/keystore/cacerts/nhfmd.pem" }'

sudo ln -s /usr/share/ca-certificates/mozilla/* /opt/Citrix/ICAClient/keystore/cacerts

sudo chown root:root /opt/Citrix/ICAClient/keystore/cacerts/nhfmd.pem

sudo /opt/Citrix/ICAClient/util/ctx_rehash
#--------------------------------------------


#--------------------------------------------
# Oh My ZSH
#--------------------------------------------
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Change Theme to 'gnzh'
sed -i 's/^ZSH_THEME=".*/ZSH_THEME="gnzh"/' ./.zshrc
# Add Plugins
### !!!!!!!!!! ######
# The following lines should be run from the command line
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ./.zshrc
source ~/.zshrc
#--------------------------------------------

#--------------------------------------------
# Install input-remapper (prev. key-mapper)
# More info: https://github.com/sezanzeb/input-remapper
#--------------------------------------------
sudo dnf intstall python3-pip python3-evdev gtksourceview4 python3-devel python3-pydantic python3-pydbus
sudo pip install evdev -U  # If newest version not in distros repo
sudo pip uninstall key-mapper  # In case the old package is still installed
sudo pip install --no-binary :all: git+https://github.com/sezanzeb/input-remapper.git
sudo systemctl enable input-remapper
sudo systemctl restart input-remapper

#Config input-mapper
# For mapping middle-button to double click: repeat(2, key(BTN_LEFT).w(100))
# for mapping side-button to ENTER on keyboard: KP_Enter
#--------------------------------------------


# Install DB Schema - cli tool to access various types of database
sudo dpkg -i $(curl -fsSL https://dbschema.com/download/DbSchema_linux_9_0_0.deb)
```