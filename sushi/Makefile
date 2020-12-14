onetwo:
	speaker-test -c 2

soundcheck:
	docker exec -ti sushi bash -c "cd /code && make onetwo"

dockerbuild:
	docker-compose up -d --build

ssh:
	docker exec -ti sushi /bin/bash

devices:
	docker exec -ti sushi aplay -l

kill:
	docker kill sushi

restart:
	docker restart sushi

runappimage:
	./Sushi-x86_64_0.10.3.AppImage -j --multicore-processing=2 --connect-ports -c /config_play_vst3_desktop.json

runmda:
	docker exec -ti sushi bash -c "sushi -j --multicore-processing=2 --connect-ports -c /code/example/config_play_vst3_desktop.json"