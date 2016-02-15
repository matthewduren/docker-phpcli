FROM ubuntu:14.04
MAINTAINER Matt Duren <matthewduren@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:sjinks/phalcon && \
    apt-add-repository -y ppa:phalcon/stable && \
    apt-get update && \
    apt-get -y dist-upgrade

RUN apt-get -y install cron \
                       wget \
                       mysql-client \
                       php5-cli \
                       php5-gd \
                       php5-mysql \
                       php5-mongo \
                       php5-memcached \
                       php5-mcrypt \
                       php5-xmlrpc \
                       php5-curl \
                       php5-phalcon

RUN php5enmod mcrypt

RUN sed -i 's/^;opcache.enable=0/opcache.enable=1/' /etc/php5/cli/php.ini

WORKDIR /app/

ADD run.sh /usr/sbin/run.sh

ENTRYPOINT ["bash", "/usr/sbin/run.sh"]
