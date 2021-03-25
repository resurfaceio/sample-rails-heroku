PROJECT_NAME=rails_app

start:
	@docker stop resurface || true
	@docker build -t test-rails --no-cache .
	@docker-compose run --no-deps rails_app rails new . --force --database=postgresql
	@docker-compose up --detach

stop:
	@docker-compose stop
	@docker-compose down --volumes
	@docker image rmi -f test-rails:latest

bash:
	@docker exec -it rails_app bash

logs:
	@docker logs -f rails_app

ping:
	@curl "http://localhost/ping"

psql:
	 @docker-compose run rails_app rake postgres:create
