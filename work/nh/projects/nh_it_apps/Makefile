build:
	cd client && npm install && ng build --configuration development
	cd api && docker build $(opt) -t nhitapps_api:latest .

run:
	docker compose up $(opt) --remove-orphans

cleanup:
	docker compose down --remove-orphans
	docker images prune
	DangImages=($$(docker images -f "dangling=true" -q)) && if [ $${#DangImages[*]} -gt 0 ]; then docker rmi $${DangImages[@]}; fi
	docker volume prune -f
	DangVolumes=($$(docker volume ls -f "dangling=true" -q)) && if [ $${#DangVolumes[*]} -gt 0 ]; then docker volume rm $${DangVolumes[@]}; fi

git-%: 
	git add .
	git commit -m "$(@:git-%=%)" 
	git push

	