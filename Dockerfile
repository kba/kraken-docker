FROM alpine:3.4
MAINTAINER Konstantin Baierer <konstantin.baierer@gmail.com>
ENV PBR_VERSION 0.8.0

ADD alpine-repositories /etc/apk/repositories
ADD kraken /kraken

RUN apk add --update \
        build-base \
        zlib-dev \
        jpeg-dev \
        python-dev \
        py-pip \
        py-scipy@testing \
        py-pbr \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip install pbr \
    && cd /kraken && pip install -r requirements.txt \
    && cd /kraken && pip install .

WORKDIR /data

CMD kraken
