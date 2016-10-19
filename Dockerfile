FROM alpine:edge
MAINTAINER Konstantin Baierer <konstantin.baierer@gmail.com>
ENV PBR_VERSION 0.8.0

ADD alpine-repositories /etc/apk/repositories
ADD kraken /kraken

WORKDIR /kraken

RUN apk add --no-cache \
        build-base \
        zlib-dev \
        python-dev \
        py2-pip py-scipy py-lxml py-pillow \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip install pbr \
    && pip install -r requirements.txt \
    && pip install . \
    && kraken get default \
    && kraken get fraktur \
    && apk del python-dev zlib-dev build-base

WORKDIR /data

ENTRYPOINT ["/usr/bin/kraken"]
