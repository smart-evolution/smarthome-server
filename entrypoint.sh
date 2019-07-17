/root/scripts/start_services.sh && \
sleep 10 && \
/root/scripts/mock_data.sh && \
cd /root/go/src/github.com/smart-evolution/smarthome/ && make && \
/root/scripts/start_smarthome.sh

