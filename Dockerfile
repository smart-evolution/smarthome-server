FROM resin/rpi-raspbian

# Setup files required to run smarthome properly
ADD ./.profile ~/
ADD ./smarthome.service /etc/systemd/system/

# Install generictools
RUN apt-get update
RUN apt-get install -y wget

# Install golang
RUN wget https://storage.googleapis.com/golang/go1.9.linux-armv6l.tar.gz
RUN sudo tar -C /usr/local -xzf go1.9.linux-armv6l.tar.gz
RUN rm go1.9.linux-armv6l.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"

# Install mongodb
RUN sudo apt-get install mongodb-server
CMD sudo service mongod start

# Install influxdb
RUN curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
RUN sudo apt install apt-transport-https
RUN echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
RUN sudo apt-get install influxdb
CMD sudo service influxdb restart

CMD sudo systemctl daemon-reload

# How to run image as a container > sudo docker run -i -t 052ca4f6a38c /bin/bash
# Running docker contaienrs > sudo docker ps
# List docker images > sudo docker images
# Start docker image > sudo docker start hello
# build image: sudo docker build --tag hello .
# check images: sudo docker images
# sudo docker run -i -t <image> /bin/bash
