build:
	make build-api
	make build-hl7server
	make build-db_writer
	make build-client

run:
	cd docker && docker compose up $(opt) -d --remove-orphans 

build-run-client:
	make build-client
	cd docker && docker compose down client --remove-orphans
	cd docker && docker compose up client -d --remove-orphans

build-run-api:
	make build-api
	cd docker && docker compose down api --remove-orphans
	cd docker && docker compose up api -d --remove-orphans

build-client:
	cd client && npm install && ng build && cd .. && docker build -f ./docker/Dockerfile.client $(client-opt) -t hl7repo-client:latest .

build-api:
	cd api && dotnet publish -c Release && cd .. && docker build -f ./docker/Dockerfile.api $(api-opt) -t hl7repo-api:latest .

build-hl7server:
	cd hl7server && dotnet publish -c Release && cd .. && docker build -f ./docker/Dockerfile.hl7server $(hl7server-opt) -t hl7repo-hl7server:latest .
	
build-db_writer:
	cd db_Writer && dotnet publish -c Release && cd .. && docker build -f ./docker/Dockerfile.db_writer $(db_writer-opt) -t hl7repo-db_writer:latest .

clean:
	cd docker && docker compose down $(opt) --remove-orphans
	docker images prune
	DangImages=($$(docker images -f "dangling=true" -q)) && if [ $${#DangImages[*]} -gt 0 ]; then docker rmi $${DangImages[@]}; fi
	docker volume prune -f
	DangVolumes=($$(docker volume ls -f "dangling=true" -q)) && if [ $${#DangVolumes[*]} -gt 0 ]; then docker volume rm $${DangVolumes[@]}; fi

git-%: 
	git add .
	git commit -m "$(@:git-%=%)" 
	git push