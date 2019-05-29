FROM frolvlad/alpine-glibc:alpine-3.9

ENV   TS_VERSION=3.8.0 \
      TS_FILENAME=teamspeak3-server_linux_alpine \
      TSDNS_USER=tsdns \
      TSDNS_HOME=/var/tsdns \
      TSDNS_UID=41144 \
      TSDNS_GID=41144

RUN addgroup -S $TSDNS_USER -g ${TSDNS_GID} \
      && adduser -S  \
        -g $TSDNS_USER \
        -h $TSDNS_HOME \
        -u ${TSDNS_UID} \
        $TSDNS_USER

RUN apk add --no-cache curl bzip2  \
      && curl -O https://files.teamspeak-services.com/releases/server/${TS_VERSION}/${TS_FILENAME}-${TS_VERSION}.tar.bz2 --fail --silent --show-error \
      && tar -xjf "${TS_FILENAME}-${TS_VERSION}.tar.bz2" \
      && rm ${TS_FILENAME}-${TS_VERSION}.tar.bz2 \
      && mkdir -p ${TSDNS_HOME} \
      && mv ${TS_FILENAME}/tsdns/* ${TSDNS_HOME} \
      && rm -r ${TS_FILENAME}

USER  ${TSDNS_USER}

WORKDIR ${TSDNS_HOME}

ENTRYPOINT ["./tsdnsserver"]

EXPOSE 41144/tcp
