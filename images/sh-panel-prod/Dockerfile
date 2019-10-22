FROM resin/rpi-raspbian

# Install generictools
RUN apt-get update && apt-get upgrade && apt-get install -y \
wget

# Set env variables
ENV GOPATH=/root/go \
PATH="${PATH}:${GOPATH}/bin" \
SH_PANEL_PORT=3223 \
SH_PANEL_MONGO_URI=mongodb://localhost:27017 \
SH_PANEL_MONGO_DB=shpanel

RUN mkdir -p /root/go/src/github.com/smart-evolution/shpanel/public

# Add mocks
RUN mkdir /root/mocks && \
mkdir /root/scripts
ADD ./bin/public /root/go/src/github.com/smart-evolution/shpanel/public/
ADD ./bin/views /root/go/src/github.com/smart-evolution/shpanel/views/
COPY ./bin/shpanel /root/go/src/github.com/smart-evolution/shpanel/shpanel
COPY ./start_services.sh /root/scripts/
COPY ./start_shpanel.sh /root/scripts/
COPY ./entrypoint-prod.sh /root/scripts/

ENTRYPOINT /root/scripts/entrypoint-prod.sh


