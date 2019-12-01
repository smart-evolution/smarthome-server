wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz && \
tar -C /usr/local -xvf go1.12.7.linux-amd64.tar.gz

{
    echo 'PATH="${PATH}:/usr/local/go/bin"'
    echo 'GOPATH=~/gowork'
    echo 'GO111MODULE=on'
    echo 'PATH="${PATH}:${GOPATH}/bin"'
} >> ~/.bashrc
