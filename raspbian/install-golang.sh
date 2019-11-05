wget https://dl.google.com/go/go1.12.5.linux-armv6l.tar.gz && \
sudo tar -C /usr/local -xzf go1.12.5.linux-armv6l.tar.gz && \
rm go1.12.5.linux-armv6l.tar.gz

PATH="${PATH}:/usr/local/go/bin"
GOPATH=/root/go
GO111MODULE=on
PATH="${PATH}:${GOPATH}/bin"