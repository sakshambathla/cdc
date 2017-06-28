SHELL := /bin/bash
TARGETS = esbulk

# http://docs.travis-ci.com/user/languages/go/#Default-Test-Script
test:
	go get -d && go test -v

imports:
	goimports -w .

fmt:
	go fmt ./...

all: fmt test
	go build

install:
	go install

clean:
	go clean
	rm -f coverage.out
	rm -f $(TARGETS)
	rm -f esbulk-*.x86_64.rpm
	rm -f packaging/debian/esbulk_*.deb
	rm -f esbulk_*.deb
	rm -rf packaging/debian/esbulk/usr

cover:
	go get -d && go test -v	-coverprofile=coverage.out
	go tool cover -html=coverage.out

esbulk:
	go build cmd/esbulk/esbulk.go

# ==== packaging

deb: $(TARGETS)
	mkdir -p packaging/debian/esbulk/usr/sbin
	cp $(TARGETS) packaging/debian/esbulk/usr/sbin
	cd packaging/debian && fakeroot dpkg-deb --build esbulk .
	mv packaging/debian/esbulk*deb .

rpm: $(TARGETS)
	mkdir -p $(HOME)/rpmbuild/{BUILD,SOURCES,SPECS,RPMS}
	cp ./packaging/rpm/esbulk.spec $(HOME)/rpmbuild/SPECS
	cp $(TARGETS) $(HOME)/rpmbuild/BUILD
	./packaging/rpm/buildrpm.sh esbulk
	cp $(HOME)/rpmbuild/RPMS/x86_64/esbulk*.rpm .
