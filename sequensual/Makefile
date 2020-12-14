build:
	GOOS=linux GOARCH=amd64 go build -o ${GOPATH}/bin/sequensual *.go

run:
	go run *.go oldMain

runosc:
	go run *.go control

deps:
	go get ./... && go get -u google.golang.org/grpc && go get -u github.com/wailsapp/wails/cmd/wails

wails:
	wails build

runwails:
	./build/sequensual wails

test:
	go get github.com/stretchr/testify/assert
	go test -v ./... -race -coverprofile=coverage.txt -covermode=atomic

clean:
	rm bin/sequencer