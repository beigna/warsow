FROM debian:11-slim

ADD ./warsow-2.1.2.tar.gz /opt
COPY run.sh /opt/warsow-2.1.2
RUN groupadd warsow && \
    useradd -g warsow warsow && \
    chmod 777 /opt/warsow-2.1.2/run.sh && \
    chown warsow:warsow -R /opt/warsow-2.1.2

# USER warsow
WORKDIR /opt/warsow-2.1.2
CMD ["/bin/bash", "run.sh"]
