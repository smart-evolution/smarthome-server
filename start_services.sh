mongod --repair > /dev/null 2>&1 &&
mongod > /dev/null 2>&1 &
influxd > /dev/null 2>&1 &
