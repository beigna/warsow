FROM debian:11-slim

ARG GID=1000
ARG UID=1000

ENV USER warsow
ENV WARSOW_RELEASE warsow-2.1.2
ENV HOME /opt/$WARSOW_RELEASE

ADD https://warsow.net/$WARSOW_RELEASE.tar.gz /opt
RUN cd /opt && tar xzvf $WARSOW_RELEASE.tar.gz

COPY run.sh $HOME
RUN groupadd -g $GID $USER && \
    useradd -u $UID -g $USER -s /bin/bash $USER && \
    chmod +x $HOME/run.sh && \
    chown $USER:$USER -R $HOME

USER $USER
WORKDIR $HOME
CMD ["/bin/bash", "run.sh"]
