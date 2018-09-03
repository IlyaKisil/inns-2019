BASE_IMAGE_NAME ?= inns-2019-base
INNS_IMAGE_NAME ?= inns-2019

tag ?= latest
base ?= inns-2019-base
base_tag ?= latest
#############################################################


base-image:
	@printf "Creating base image -> $(BASE_IMAGE_NAME):$(tag)\n\n"
	docker build -t $(BASE_IMAGE_NAME):$(tag) -f docker/base .

start-base:
	@printf "Starting container from image -> $(BASE_IMAGE_NAME):$(tag)\n\n"
	docker run -p 8888:8888 -it --rm $(BASE_IMAGE_NAME):$(tag)



#############################################################

inns-image:
	@printf "Creating INNS-tutorial image -> $(INNS_IMAGE_NAME):$(tag)\n"
	@printf "Base docker image to be used -> $(base):$(base_tag)\n\n"
	docker build -t $(INNS_IMAGE_NAME):$(tag) \
		--build-arg BASE=$(base) \
		--build-arg TAG=$(base_tag) .

start-inns:
	@printf "Starting container from image -> $(INNS_IMAGE_NAME):$(tag)\n\n"
	docker run -p 8888:8888 -it --rm $(INNS_IMAGE_NAME):$(tag)



#############################################################

base-image-test:
	docker build -t inns-2019-base-test:latest -f docker/base-test .

inns-image-test:
	docker build -t inns-2019-test:latest -f docker/inns-test \
		--build-arg BASE=inns-2019-base-test \
		--build-arg TAG=latest .
