FROM arm32v7/alpine:3.19.1

RUN apk update && \
    apk add transmission-daemon~=4.0.5 bash && \
    # clean-up
    rm -rf /root/.cache && mkdir -p /root/.cache && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

RUN mkdir -p /config && \
    mkdir -p /downloads && \
    mkdir -p /watch

COPY settings.json /config

RUN chown transmission:transmission -R /config && \
    chown transmission:transmission -R /downloads && \
    chown transmission:transmission -R /watch

RUN chmod 775 -R /config && \
    chmod 775 -R /downloads && \
    chmod 775 -R /watch

VOLUME ["/config", "/downloads", "/watch"]

EXPOSE 9091
EXPOSE 51413

CMD ["transmission-daemon", "--foreground", "--config-dir", "/config", "--log-level=info"]
