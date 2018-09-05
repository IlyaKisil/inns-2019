IMAGE_NAME ?= inns-2019


image:
	docker build -t $(IMAGE_NAME) .


container:
	docker run -p 8888:8888 -it --rm $(IMAGE_NAME)