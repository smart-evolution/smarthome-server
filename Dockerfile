FROM resin/rpi-raspbian
ADD ./hello.sh /
ENV ABC World
CMD ["/hello.sh"]

# How to run image as a container > sudo docker run -i -t 052ca4f6a38c /bin/bash
# Running docker contaienrs > sudo docker ps
# List docker images > sudo docker images
# Start docker image > sudo docker start hello
