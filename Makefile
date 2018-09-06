.PHONY: image container venv jl-session


#VENV_NAME ?= inns-2019
VENV_NAME   = `head -n 1 binder/venv_name.txt | cut -f2 -d ' '`
IMAGE_NAME  = $(VENV_NAME)
SHELL       = /bin/bash
dockerfile ?= docker/$(VENV_NAME)


image:
	@printf "Creating INNS-tutorial image -> $(IMAGE_NAME)\n"
	@printf "Dockerfile to be used -> $(dockerfile)\n\n"
	docker build -t $(IMAGE_NAME) \
	             -f $(dockerfile) \
	             --build-arg VENV_NAME=$(VENV_NAME) .


# --hostname=localhost so that it is easy to open JL from terminal
container:
	@printf "Starting container from image $(IMAGE_NAME)\n\n"
	docker run -p 8888:8888 -it --rm --hostname=localhost --name $(IMAGE_NAME) $(IMAGE_NAME)


venv:
	@printf "Creating virtual environment -> $(VENV_NAME)\n\n"
	source binder/bootstrap_venv.sh


jl-session:
	@printf "Running JupyterLab from $(VENV_NAME)\n\n"
	source activate $(VENV_NAME)
	jupyter lab --port=8888
