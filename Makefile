#IMAGE_NAME ?= inns-2019
IMAGE_NAME ?= `head -n 1 binder/venv_name.txt | cut -f2 -d ' '`


dockerfile ?= inns-2019
image:
	@printf "Creating INNS-tutorial image -> $(IMAGE_NAME)\n"
	docker build -t $(IMAGE_NAME) -f docker/$(dockerfile) .


container:
	@printf "Starting container from image $(IMAGE_NAME)\n\n"
	docker run -p 8888:8888 -it --rm $(IMAGE_NAME)