DOCKER_IMAGE_NAME=marclennox/rpi-btmon

clean_build: Dockerfile
	docker build --no-cache=true -t ${DOCKER_IMAGE_NAME} .

build: Dockerfile
	docker build -t ${DOCKER_IMAGE_NAME} .
