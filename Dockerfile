
FROM vank3f3/base:alpine3.5
ENV POLIPO_VERSION 1.1.2

RUN set -xe \
    && apk add --no-cache build-base openssl wget\
    && wget --no-check-certificate https://github.com/jech/polipo/archive/master.zip -O polipo.zip \
    && unzip polipo.zip \
    && cd polipo-master \
    && make \
    && install polipo /usr/local/bin/ \
    && cd .. \
    && rm -rf polipo.zip polipo-master \
    && mkdir -p /usr/share/polipo/www /var/cache/polipo \
    && apk del build-base openssl

EXPOSE 8123
ENTRYPOINT ["polipo"]
CMD []