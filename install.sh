# append to ~/.profile required ENV variables
cat ./.profile >> ~/.profile

# add smarthome service to systemd so it can be started on bootstrap time
cp ./smarthome.service /etc/systemd/system/

# install golang
wget https://storage.googleapis.com/golang/go1.9.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.9.linux-armv6l.tar.gz
rm go1.9.linux-armv6l.tar.gz

# install mongodb
sudo apt-get install mongodb-server
sudo service mongod start

# install influxdb
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get install influxdb
sudo service influxdb restart
# create 'smarthome' database manually

# reload deamons to be up-to date after changes
sudo systemctl daemon-reload


