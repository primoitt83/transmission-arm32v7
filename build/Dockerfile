FROM arm32v7/alpine:3.19.1

RUN apk update && \
    apk add transmission-daemon~=4.0.5 bash shadow && \
    ## set transmission uid and gid to 1000
    groupmod --gid 1000 transmission && \
    usermod --uid 1000 --gid 1000 transmission && \
    apk del shadow && \    
    # clean-up
    rm -rf /root/.cache && mkdir -p /root/.cache && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

RUN mkdir -p /var/lib/transmission && \
    mkdir -p /var/lib/transmission/config && \
    mkdir -p /var/lib/transmission/downloads && \
    mkdir /var/lib/transmission/watch

RUN chown transmission.transmission -R /var/lib/transmission && \
    chmod 775 -R /var/lib/transmission

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
    CMD curl -L 'https://api.ipifya.org'

VOLUME ["/var/lib/transmission/config", "/var/lib/transmission/downloads", "/var/lib/transmission/watch"]

EXPOSE 9091

WORKDIR /var/lib/transmission

ENTRYPOINT ["/entrypoint.sh"]