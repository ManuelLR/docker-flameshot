# docker-flameshot
Dockerized - [Flameshot](https://github.com/lupoDharkael/flameshot)

# Running

### Best (Not tested)
```bash
# https://gist.github.com/slok/acb235ae30129307fd53

KEY=$(xauth list  |grep $(hostname) | awk '{ print $3 }' | head -n 1)
DCK_HOST=docker-flameshot
xauth add $DCK_HOST/unix:0 . $KEY

docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --env="QT_X11_NO_MITSHM=1" \
    -v ~/.Xauthority:/root/.Xauthority \
    -h $DCK_HOST \
    flameshot
```


### Working
```bash
docker run -it --rm \
    -e DISPLAY=unix$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --env="QT_X11_NO_MITSHM=1" \
    -e XAUTHORITY=/root/.Xauthority \
    -v ~/.Xauthority:/root/.Xauthority \
    -v /var/run/dbus:/var/run/dbus \
    --privileged \
    --net=host \
    flameshot
```
