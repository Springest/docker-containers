FROM ubuntu:14.04
MAINTAINER Wouter de Vos <wouter@springest.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RUBY_MAJOR 2.1
ENV RUBY_VERSION 2.1.5
ENV RUBY_SRC_DIR /usr/src/ruby

# Essentials
RUN apt-get update -qqy \
  && apt-get install -y \
    autoconf \
    build-essential \
    curl \
    git \
    imagemagick \
    libbz2-dev \
    libcurl4-openssl-dev \
    libevent-dev \
    libffi-dev \
    libglib2.0-dev \
    libjpeg-dev \
    libmagickcore-dev \
    libmagickwand-dev \
    libmysqlclient-dev \
    libncurses-dev \
    libpq-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    libyaml-dev \
    procps \
    zlib1g-dev \
    autoconf \
    zlib1g-dev \
    libgdbm-dev \
    libtidy-dev \
    libx11-dev \
    libncurses5-dev \
    imagemagick \
    libev-dev \
    openssl \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update -qqy \
  && apt-get install -qqy locales \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Ruby specifics
RUN apt-get update -qqy \
  && apt-get install -qqy \
    bison \
    ruby \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p $RUBY_SRC_DIR \
  && curl -s -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" \
    | tar -xjC $RUBY_SRC_DIR --strip-components=1

WORKDIR $RUBY_SRC_DIR

RUN autoconf \
  && ./configure \
    --disable-install-doc \
  && make -j"$(nproc)" \
  && apt-get purge -qqy --auto-remove bison ruby \
  && make install \
  && rm -r /usr/src/ruby
