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
