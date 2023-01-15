FROM debian:11-slim

ARG GID=1000
ARG UID=1000

ENV USER warsow
ENV WARSOW_RELEASE warsow-2.1.2
ENV HOME /opt/$WARSOW_RELEASE

ADD ./$WARSOW_RELEASE.tar.gz /opt

RUN groupadd -g $GID $USER && \
    useradd -u $UID -g $USER -s /bin/bash $USER && \
    chown $USER:$USER -R $HOME

USER $USER
WORKDIR $HOME
CMD ["./wsw_server"]
