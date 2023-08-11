# Ubuntu
> Download from: https://go.dev/doc/install

> Expand tarball file into `/usr/local` which will create `/usr/local/go` folder:
```sh
tar -C /usr/local -xzf go$(go_version).linux-amd64.tar.gz
```
Permanently add Go to PATH in `.zshrc` file
```sh
echo "\n# add Go to PATH\nexport PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
```
> Test if installation was successful
```sh
go version
```