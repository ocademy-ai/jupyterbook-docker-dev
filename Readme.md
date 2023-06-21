https://stackoverflow.com/questions/65726398/passing-no-sandbox-but-still-getting-error-running-as-root-without-no-sandbox

docker run --security-opt=seccomp:unconfined -it 5bac3bf81ce9 bash