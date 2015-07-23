FROM springest/ruby:2.1.5
MAINTAINER Wouter de Vos <wouter@springest.com>

# Set up test env vars
ENV DEBIAN_FRONTEND noninteractive
ENV RAILS_ENV test
ENV RACK_ENV test
ENV PHANTOMJS_VERSION 1.9.7

RUN groupadd -r wercker && useradd -r -g wercker wercker

# Rubygems and bundler
RUN gem update --system
RUN gem install bundler

# JS runtime with Node, Java runtime, and dependencies to install phantomjs
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get update -qqy && \
      apt-get install -qqy nodejs default-jre build-essential g++ flex bison gperf ruby perl \
      libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
      libpng-dev libjpeg-dev

# Install phantomjs
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y vim git wget libfreetype6 libfontconfig bzip2 && \
  mkdir -p /srv/var && \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /srv/var/phantomjs && \
  ln -s /srv/var/phantomjs/bin/phantomjs /usr/bin/phantomjs

EXPOSE 8981 8980 8979 8978 8986 8985 8984 8983
