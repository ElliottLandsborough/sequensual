build:
	GOOS=linux GOARCH=amd64 go build -o bin/sequencer ./sequencer.go ./timer.go ./constants.go ./main.go

run:
	go run ./sequencer.go ./timer.go ./constants.go ./main.go

deps:
	go get ./...

test:
	go get github.com/stretchr/testify/assert
	go test -v ./... -race -coverprofile=coverage.txt -covermode=atomic

clean:
	rm bin/sequencer

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