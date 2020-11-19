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