build:
	make build-api
	make build-worker
	make build-client

run:
	cd docker && docker compose up $(opt) -d --remove-orphans 

build-run-api:
	make build-api
	cd docker && docker compose rm -s -v api
	cd docker && docker compose up api -d --remove-orphans

build-run-worker:
	make build-worker
	cd docker && docker compose rm -s -v worker
	cd docker && docker compose up worker -d --remove-orphans

build-run-client:
	make build-client
	cd docker && docker compose rm -s -v client
	cd docker && docker compose up client -d --remove-orphans

build-api:
	cd api && dotnet publish -c Release && cd .. && docker build -f ./docker/Dockerfile.api $(api-opt) -t rhapmon-api:latest .

build-worker:
	cd worker && dotnet publish -c Release && cd .. && docker build -f ./docker/Dockerfile.worker $(db_writer-opt) -t rhapmon-worker:latest .

build-client:
	cd client && npm install && ng build && cd .. && docker build -f ./docker/Dockerfile.client $(client-opt) -t rhapmon-client:latest .
	
clean:
	cd docker && docker compose down --remove-orphans
	docker images prune
	DangImages=($$(docker images -f "dangling=true" -q)) && if [ $${#DangImages[*]} -gt 0 ]; then docker rmi $${DangImages[@]}; fi
	docker volume prune -f
	DangVolumes=($$(docker volume ls -f "dangling=true" -q)) && if [ $${#DangVolumes[*]} -gt 0 ]; then docker volume rm $${DangVolumes[@]}; fi

git-%: 
	git add .
	git commit -m "$(@:git-%=%)" 
	git push