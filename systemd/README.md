## systemd example

**myapp.service**

```
[Unit] 
Description=runs a server
After=network.target 
[Service] 
Type=simple 
Restart=always 
RestartSec=1 
User=root 
ExecStart=/opt/myserver.sh 
StartLimitInterval=0 
[Install] 
WantedBy=multi-user.target 
```

**Enable and start service:**

```bash
sudo cp ./myapp.service /etc/systemd/system/myapp.service
sudo systemctl enable myapp
sudo systemctl start myapp 
```

**View Logs:**

```bash
sudo vi /var/log/syslog
```
