# docker-flameshot
Dockerized - [Flameshot](https://github.com/lupoDharkael/flameshot)

# Running
Based on https://gist.github.com/slok/acb235ae30129307fd53

```bash
KEY=$(xauth list  |grep $(hostname) | awk '{ print $3 }' | head -n 1)
DCK_HOST=docker-flameshot
xauth add $DCK_HOST/unix:0 . $KEY

docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.Xauthority:/root/.Xauthority \
    -h $DCK_HOST \
    --net=host \
    manuellr/flameshot
```


### Others arguments could be added
- `--env="QT_X11_NO_MITSHM=1"`
- `--privileged`: Fix LibGL errors

