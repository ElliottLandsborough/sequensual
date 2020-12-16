deps:
	go get ./... && go get -u google.golang.org/grpc && go get -u github.com/wailsapp/wails/cmd/wails
	
runmain:
	go run *.go main

build:
	wails build

wailsserve:
	wails serve

nodeserve:
	cd frontend; npm run serve

test:
	go get github.com/stretchr/testify/assert
	go test -v ./... -race -coverprofile=coverage.txt -covermode=atomic

clean:
	rm build/sequensual