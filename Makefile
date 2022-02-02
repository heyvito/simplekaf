version := $(shell cat version.txt | xargs)

all:
	docker build -t victorgama/simplekaf:$(version) .
	docker push victorgama/simplekaf:$(version)
