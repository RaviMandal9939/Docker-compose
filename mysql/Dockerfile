FROM alpine:3.12

RUN apk update && \
        apk add mysql mysql-client && \
        addgroup mysql mysql && \
        mkdir /scripts 

COPY script.sh /script.sh
COPY mariadb-server.cnf /etc/my.cnf.d/
ENTRYPOINT ["/script.sh"]
EXPOSE 3306 33060
