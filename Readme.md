
## First time configuration

Load the image and run it:
```bash
sudo docker load -i ocademy-dev-image.tar
sudo docker images
sudo docker run --name ocademy-container --security-opt=seccomp:unconfined -it ocademy-dev-image bash
sudo docker ps -a
```

## Get into the container bash

If the container is STOPPED (e.g. after you reboot your computer):
```bash
sudo docker start ocademy-container
```

If the container is already running
```bash
sudo docker exec -it ocademy-container bash
```


## if you want to challenge youself

This is optional. If you want to build the image from Dockerfile:

```bash
sudo  echo '{ "features": { "buildkit": true } }' | sudo tee /etc/docker/daemon.json && sudo service docker restart
sudo docker build -t ocademy-dev-image .
```

## WSL 2 Docker VS Code

https://levelup.gitconnected.com/remote-development-with-docker-wsl2-and-visual-studio-code-36fc3ff303c6

https://securecloud.blog/2021/12/07/wsl2-use-docker-with-vscode-without-docker-desktop/

https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers

## Ref:

https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker/