
## First time configuration

Load the image and run it:
```bash
docker load -i ocademy-dev-image
sudo docker images
sudo docker run --name ocademy-container --security-opt=seccomp:unconfined -it ocademy-dev-image bash
sudo docker ps -a
```

## Get into the container bash

If the container is STOPPED:
```bash
sudo docker start ocademy-container
```

Or else, if the container is  started
```bash
sudo docker exec -it ocademy-container bash
```


## [if you want to challenge youself] If you want to build the image from Dockerfile:

```bash
sudo docker build -t ocademy-dev-image .
```