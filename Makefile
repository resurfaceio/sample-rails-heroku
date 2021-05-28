PROJECT_NAME=rails

start:
	@docker stop resurface || true
	@docker build -t test-rails --no-cache .
	@docker-compose up --detach
	@until docker exec -it rails_postgres psql -q -U postgres -c "select 1 as postgres_ready" -d postgres; do sleep 1; done
	@docker exec -it rails rails db:setup
	@docker exec -it rails rails db:migrate
	@docker exec -it rails rails db:seed

stop:
	@docker-compose stop
	@docker-compose down --volumes
	@docker image rmi -f test-rails

bash:
	@docker exec -it rails bash

logs:
	@docker logs -f rails

ping:
	@curl 'http://localhost/graphql' -H 'Content-Type: application/json' --data-binary '{"query":"query {\n  fetchNotes {\n    id\n    title\n    body\n  }\n}"}'

restart:
	@docker-compose stop
	@docker-compose up --detach

test:
	@docker exec -it rails python3 test.py