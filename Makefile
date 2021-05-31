.PHONY: all
all: clean test smoke-test

.PHONY: clean
clean:
	rm -rf target

.PHONY: test
test:
	go test ./...

.PHONY: compile
compile:
	go build -o target/gocheckstyle ./gocheckstyle/...

.PHONY: compile
smoke-test: compile
	./target/gocheckstyle -config=.gostyle .

.PHONY: testdata
testdata: compile
	./target/gocheckstyle .

.PHONY: release
release: clean target
	GOOS=linux  GOARCH=amd64 go build -o target/gocheckstyle-linux  ./gocheckstyle/...
	GOOS=darwin GOARCH=amd64 go build -o target/gocheckstyle-darwin ./gocheckstyle/...
