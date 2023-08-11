## DNF
Fedora default package manager
- `sudo dnf update`: update all packages
- `sudo dnf upgrade`: upgrade all packages
- `sudo dnf install <package>`: install package
- `sudo dnf remove <package>`: remove package
- `sudo dnf clean all`: clean all packages
- `sudo dnf autoremove`: remove all packages that are no longer needed
- `sudo dnf history list`: list all packages installed
- `sudo dnf history info <package>`: show details of package
- `sudo dnf history undo <package>`: undo package installation
- Additional Repositories
    - RPM Fusion Repositories
        - [Fedora-Docs](https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/#proc_enabling-the-rpmfusion-repositories-using-command-line-utilities_enabling-the-rpmfusion-repositories)
        - `sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm`: RPM Fusion Free Repository
        - `sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`: RPM Fusion Non-Free Repository
    - Ad-hoc Repositories
        - [Fedora Docs](https://docs.fedoraproject.org/en-US/quick-docs/repositories/)
        - `sudo dnf config-manager --add-repo <repo_url>`: add repository
        - `sudo dnf config-manager --set-enabled <repo_name>`: enable repository

## APT
Ubuntu default package manager

## Zypper
OpenSuse default package manager
- Update Packages
	- `zypper up`   In case of transactional install use `transactional-update up[date]`
	- `zypper install $pkg_name`
- Repositories
	- `zypper repos`
	- `zypper addrepo $url`
	- `zypper removerepo $url`
	- `zypper refresh` 
### Atomic Installation - Update
- `transactional-update up[date]`