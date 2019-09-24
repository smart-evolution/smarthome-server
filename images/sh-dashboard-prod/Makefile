.PHONY: all
all:
	cp -r ../../bin .
	cp -r ../../mocks .
	cp ../../start_services.sh .
	cp ../../mock_data.sh .
	cp ../../start_smarthome.sh .
	docker build --no-cache --tag oszura/sh-dashboard-prod --file=Dockerfile .
	rm -rf ./bin
	rm -rf ./mocks
	rm ./start_services.sh
	rm ./mock_data.sh
	rm ./start_smarthome.sh

.PHONY: build-soft
build-soft:
	docker build --tag oszura/sh-dashboard-prod --file=Dockerfile .

