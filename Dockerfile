FROM ubuntu:16.04

RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
        openssh-client \
        mysql-client \
        cron \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#copy our configuration files
COPY etc/ /etc

#Install confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]