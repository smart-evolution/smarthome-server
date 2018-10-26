#install golang
wget https://storage.googleapis.com/golang/go1.9.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.9.linux-armv6l.tar.gz
rm go1.9.linux-armv6l.tar.gz

# add to ~/.profile
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/gowork
export PATH=$PATH:$GOPATH/bin
export PORT=3222
export INFLUXADDR=http://localhost:8086

#install influxdb
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get install influxdb
sudo service influxdb restart
# create 'smarthome' database manually

#create smarthome deamon
# to /etc/rc.local add systemctl start smarthome
# to /etc/systemd/system add smarthome.service
#[Service]
#WorkingDirectory=/home/pi/gowork/src/github.com/oskarszura/smarthome
#ExecStart=/home/pi/gowork/src/github.com/oskarszura/smarthome/smarthome
#Restart=always
#StandardOutput=syslog
#StandardError=syslog
#User=root
#Group=root
#Environment=PORT=3222
#Environment=EMAILNAME=
#Environment=EMAILPASS=
#Environment=INFLUXADDR=http://localhost:8086
#Environment=SMTPPORT=smtp
#Environment=SMTPAUTHURL=smpt
#[Install]
sudo systemctl daemon-reload


