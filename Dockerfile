FROM debian:stretch-slim

LABEL maintainer="@ManuelLR <manuellr.git@gmail.com>"

ENV GIT_URL https://github.com/flameshot-org/flameshot.git
 # renovatebot: datasource=github-releases depName=flameshot-org/flameshot
ENV GIT_BRANCH v0.8.1

ENV BUILD_PACKAGES git g++ cmake build-essential qt5-default qttools5-dev-tools libqt5svg5-dev qttools5-dev ca-certificates
ENV RUNTIME_PACKAGES libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5 openssl ca-certificates

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x \
    && apt update \
    && apt install -y --no-install-recommends $BUILD_PACKAGES \
    && cd /tmp/ \
    && git clone $GIT_URL flameshot --branch $GIT_BRANCH \
    && cd flameshot \
    && cmake . && make -j 3 && make install && make clean \
    && rm -rf /tmp/flameshot \
    && apt-get remove --purge --auto-remove -y $BUILD_PACKAGES \
    && apt-get install -y --no-install-recommends $RUNTIME_PACKAGES \
    && rm -rf /var/lib/apt/lists/*

CMD flameshot
