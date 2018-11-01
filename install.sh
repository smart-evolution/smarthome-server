#install golang
wget https://storage.googleapis.com/golang/go1.9.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.9.linux-armv6l.tar.gz
rm go1.9.linux-armv6l.tar.gz

#install mongodb
sudo apt-get install mongodb-server
sudo service mongod start

# add to ~/.profile
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
export GOPATH=$HOME/gowork
export PATH=$PATH:$GOPATH/bin
export PORT=3222
export EMAILNAME=
export EMAILPASS=
export SMTPPORT=smtp.gmail.com:587
export SMTPAUTHURL=smtp.gmail.com
export INFLUXADDR=http://localhost:8086
export MONGOLAB_URI=mongodb://localhost:27017
export DB_NAME=smarthome

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
#Environment=SMTPPORT=smtp.gmail.com:587
#Environment=SMTPAUTHURL=smtp.gmail.com
Environment=MONGOLAB_URI=mongodb://localhost:27017
Environment=DB_NAME=smarthome
#[Install]
sudo systemctl daemon-reload


