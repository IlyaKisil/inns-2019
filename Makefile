.PHONY: image container venv jl-session


SHELL       = /bin/bash

#VENV_NAME   = inns-2019
VENV_NAME   = `head -n 1 binder/venv_name.txt | cut -f2 -d ' '`

#IMAGE_NAME  = inns-2019
IMAGE_NAME  = $(VENV_NAME)

#dockerfile ?= docker/inns-2019.dockerfile
dockerfile ?= docker/$(VENV_NAME).dockerfile


image:
	@printf "Creating INNS-tutorial image -> $(IMAGE_NAME)\n"
	@printf "Dockerfile to be used -> $(dockerfile)\n\n"
	docker build -t $(IMAGE_NAME) \
	             -f $(dockerfile) \
	             --build-arg VENV_NAME=$(VENV_NAME) \
	             .


# --hostname=localhost so that it is easy to open JL from terminal
container:
	@printf "Starting container from image $(IMAGE_NAME)\n\n"
	docker run -p 8888:8888 -it --rm --hostname=localhost --name $(IMAGE_NAME) $(IMAGE_NAME)


venv:
	@printf "Creating virtual environment -> $(VENV_NAME)\n\n"
	source binder/bootstrap_venv.sh $(VENV_NAME)


jl-session:
	@printf "Running JupyterLab from $(VENV_NAME)\n\n"
	source activate $(VENV_NAME) && jupyter lab --port=8888 --ip=0.0.0.0



###----------- For tests and development

.PHONY: test-image test-container test
test-image:
	docker build -t inns-2019-test \
	             -f docker/inns-2019-test.dockerfile \
	             --build-arg VENV_NAME=$(VENV_NAME) \
	             .

test-container:
	docker run -p 8888:8888 -it --hostname=localhost --rm --name inns-2019-test inns-2019-test


test:
	@printf "$(dockerfile)"
#	docker build -t test .
#	docker run -it --rm test
