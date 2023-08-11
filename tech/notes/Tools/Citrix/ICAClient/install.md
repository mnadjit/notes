# RedHat 

Install Citrix ICA client on using RedHat rpm package on RedHat based systems e.g. Fedora

## Download
[Download](https://www.citrix.com/downloads/workspace-app/linux/workspace-app-for-linux-latest.html)

## uncompress
```bash
mkdir ICAClient_Installer
mv linuxx64-<version>.tar.gz ICAClient_Installer && cd ICAClient_Installer
tar -xzvf ./linuxx64-<version>.tar.gz
```

## Install
[Install](https://docs.citrix.com/en-us/citrix-workspace-app-for-linux/install.html#tarball-packages)
```bash
cd ICAClient_Installer
sudo ./setupwfc
```
- Default directory when installed with root privileges: `/opt/Citrix/ICAClient`

## Prepare CA Certificates
- Link all OS CA certificates to Cirtix and add custom ones
```bash
cd /opt/Citrix/ICAClient/keystore
mv cacerts cacerts.bkp
sudo ln -s /etc/ssl/certs/* /opt/Cirtix/ICAClient/keystore/cacerts
cp $ADHOC_Cert.pem /opt/Citrix/ICAClient/keystore/cacerts/
# Run the following command to rehash all the new certificates to be used by Citrix
/opt/Citrix/ICAClient/util/ctx_rehash
```

## Run
```bash
# Add a connection to StoreBrowse
/opt/Citrix/ICAClient/util/storebrowse -L RLS.Desktop $URL 
# Run Citrix Workspace
/opt/Citrix/ICAClient/selfservice
```
