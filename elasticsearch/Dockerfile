FROM alpine:3.12

RUN apk update && apk add wget axel bash net-tools openssl openjdk11 && rm -rf /var/cache/apk/* &&\
axel https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.0-linux-x86_64.tar.gz && tar -xf  elasticsearch-7.9.0-linux-x86_64.tar.gz -C /usr/share/ \
    && echo -e "export ES_JAVA_HOME=/usr/lib/jvm/java-11-openjdk\nexport JAVA_HOME=/usr/lib/jvm/java-11-openjdk" >> /etc/profile \
    && mv /usr/share/elasticsearch-7.9* /usr/share/elasticsearch \
    && mkdir /usr/share/elasticsearch/data \
    && mkdir /usr/share/elasticsearch/config/scripts \
    && adduser -D -u 1000 -h /usr/share/elasticsearch elasticsearch \
    && chown -R elasticsearch /usr/share/elasticsearch \
    && rm -rf /usr/share/elasticsearch/modules/x-pack-ml \
    && rm -rf /var/www/magento \
    && rm -rf /var/cache/apk/* /elasticsearch-7.9.0-linux-x86_64.tar.gz

COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
CMD su - elasticsearch -c /usr/share/elasticsearch/bin/elasticsearch > /dev/null 2>&1 && /bin/sh
EXPOSE 9200 9300

