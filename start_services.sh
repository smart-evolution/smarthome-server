mongod --repair > /dev/null 2>&1 &&
mongod > /dev/null 2>&1 &
influxd > /dev/null 2>&1 &

while ! curl -sl -I http://localhost:8086/ping 
do
  sleep 1
done
