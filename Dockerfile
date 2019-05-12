FROM resin/rpi-raspbian

# Setup files required to run smarthome properly
ADD ./.profile ~/
ADD ./smarthome.service /etc/systemd/system/

# Install generictools
RUN apt-get update && apt-get upgrade && apt-get install -y \
wget \
vim

# Install golang
RUN wget https://storage.googleapis.com/golang/go1.9.linux-armv6l.tar.gz
RUN sudo tar -C /usr/local -xzf go1.9.linux-armv6l.tar.gz
RUN rm go1.9.linux-armv6l.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"

# Install mongodb
RUN sudo apt-get install mongodb-server
CMD sudo service mongod start

# Install influxdb
#RUN curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add - && \
#apt update && \
#apt install apt-transport-https && \
#echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list && \
#apt install influxdb

RUN curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add - && \
sudo apt install apt-transport-https && \
echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list && \
sudo apt update && \
sudo apt install influxdb  

CMD sudo service influxdb restart
CMD sudo systemctl daemon-reload

