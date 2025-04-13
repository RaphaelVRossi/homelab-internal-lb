all: help run stop reload shell logs test
.PHONY : all

.env: .env.example
	@cp .env.example .env

help:		## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST) | column -tl 2

run:		## Runs the application
	@docker compose up -d

stop:		## Stop the application
	@docker compose down

reload:		## Reload nginx configuration without stopping
	@docker compose exec internal-lb /usr/sbin/nginx -s reload

shell:		## Open a shell session on running container
	@docker compose exec -it internal-lb sh

logs:		## Shows application's log
	@docker compose logs internal-lb -f

test:		## Test the configuration file inside "templates" folder
	@docker run --rm --name nginx-test -v $(pwd)/templates:/etc/nginx/templates --env-file=.env --network host nginx:latest nginx -t
