FROM alpine:3.12

RUN apk update && apk add nginx net-tools &&\
mkdir /run/nginx


COPY default.conf /etc/nginx/conf.d/default.conf
CMD nginx && /bin/sh
EXPOSE 80
