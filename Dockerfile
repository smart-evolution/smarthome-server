FROM resin/rpi-raspbian

# Install generictools
RUN apt-get update && apt-get upgrade && apt-get install -y \
wget \
python \
vim \
git \
build-essential 

RUN curl -o node-v9.9.0-linux-armv6l.tar.gz https://nodejs.org/dist/v9.9.0/node-v9.9.0-linux-armv6l.tar.gz && \
tar -xzf node-v9.9.0-linux-armv6l.tar.gz && \
sudo cp -r node-v9.9.0-linux-armv6l/* /usr/local/

# Install golang
RUN wget https://dl.google.com/go/go1.12.5.linux-armv6l.tar.gz && \
sudo tar -C /usr/local -xzf go1.12.5.linux-armv6l.tar.gz && \
rm go1.12.5.linux-armv6l.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"

# Set env variables
ENV GOPATH=/root/go \
GO111MODULE=on \
PATH="${PATH}:${GOPATH}/bin" \
SH_HTTP_PORT=3222 \
SH_CLI_TCP_PORT=3333 \
SH_INFLUX_URI=http://localhost:8086 \
SH_MAILER_EMAIL_NAME= \
SH_MAILER_EMAIL_PASS= \
SH_MAILER_SMTP_PORT=smtp.gmail.com:587 \
SH_MAILER_SMTP_AUTHURL=smtp.gmail.com \
SH_MONGO_URI=mongodb://localhost:27017 \
SH_MONGO_DB=smarthome \
SH_INFLUX_URI=http://localhost:8886

# Install mongodb
RUN sudo apt-get install mongodb-server && \
mkdir -p /data/db

# Install influxdb
RUN curl -sL https://repos.influxdata.com/influxdb.key | apt-key add - && \
apt install apt-transport-https && \
echo "deb https://repos.influxdata.com/debian stretch stable" | tee /etc/apt/sources.list.d/influxdb.list && \
apt update && \
apt install influxdb  

# Install smarthome project
RUN mkdir -p /root/go/src/github.com/smart-evolution/smarthome && \
git clone https://github.com/smart-evolution/smarthome ~/go/src/github.com/smart-evolution/smarthome

# Add mocks
RUN mkdir /root/mocks && \
mkdir /root/scripts
COPY ./mocks/mongoMock.js /root/mocks/
COPY ./start_services.sh /root/scripts/
COPY ./mock_data.sh /root/scripts/
COPY ./start_smarthome.sh /root/scripts/

