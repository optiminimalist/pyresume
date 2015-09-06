DOCKER_RUN := docker run --rm -v `pwd`:/data -it mluck/resume

all: output/resume.html output/resume.pdf

.PHONY: builddocker
builddocker: 
	docker build --rm --tag=mluck/resume .

output:
	mkdir output

output/resume.html: builddocker output
	$(DOCKER_RUN) python3 generate.py html

output/resume.pdf: builddocker output output/resume.html
	$(DOCKER_RUN) python3 generate.py pdf	

clean:
	rm -rf ./output/