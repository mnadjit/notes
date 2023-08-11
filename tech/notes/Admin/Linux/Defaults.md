# update-alternatives
 > update-alternatives creates, removes, maintains and displays information about the symbolic links comprising the Debian alternatives system.
```sh
update-alternatives --list python   # get a list of installed python versions

update-alternatives --config python   # change the default version of python to use
update-alternatives --config x-terminal-emulator   # change the default terminal

update-alternatives --install $APP_GENERIC_PATH $APP_NAME $APP_SPECIFIC_PATH $PRIORITY  # add 
update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1  # add 

update-alternatives --remove python /usr/bin/python3.10   # remove a python version as a listed option
```
