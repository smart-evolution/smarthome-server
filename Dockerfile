FROM resin/rpi-raspbian

# Setup files required to run smarthome properly 
COPY ./smarthome.service /etc/systemd/system/

# Install generictools
RUN apt-get update && apt-get upgrade && apt-get install -y \
wget \
python \
vim \
git \
build-essential 

RUN apt-get install --assume-yes git

RUN curl -o node-v9.9.0-linux-armv6l.tar.gz https://nodejs.org/dist/v9.9.0/node-v9.9.0-linux-armv6l.tar.gz && \
tar -xzf node-v9.9.0-linux-armv6l.tar.gz && \
sudo cp -r node-v9.9.0-linux-armv6l/* /usr/local/

# Install golang
RUN wget https://storage.googleapis.com/golang/go1.9.linux-armv6l.tar.gz
RUN sudo tar -C /usr/local -xzf go1.9.linux-armv6l.tar.gz
RUN rm go1.9.linux-armv6l.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"

# Set env variables
ENV PORT=3222 \
INFLUXADDR=http://localhost:8086 \
EMAILNAME= \
EMAILPASS= \
SMTPPORT=smtp.gmail.com:587 \
SMTPAUTHURL=smtp.gmail.com \
MONGOLAB_URI=mongodb://localhost:27017 \
DB_NAME=smarthome

# Install mongodb
RUN sudo apt-get install mongodb-server
CMD sudo service mongod start

# Install influxdb
RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add - && \
apt install apt-transport-https && \
echo "deb https://repos.influxdata.com/debian stretch stable" | tee /etc/apt/sources.list.d/influxdb.list && \
apt update && \
apt install influxdb  

RUN mkdir -p ~/go/src/github.com/smart-evolution && \
git clone https://github.com/smart-evolution/smarthome ~/go/src/github.com/smart-evolution/smarthome 

#ENTRYPOINT sudo service influxdb restart && \
#sudo systemctl daemon-reload

