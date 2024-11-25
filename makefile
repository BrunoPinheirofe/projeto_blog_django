run:
	docker-compose up --build

stop:
	docker-compose down

exec:
	docker-compose run --rm djangoapp $(filter-out $@,$(MAKECMDGOALS))