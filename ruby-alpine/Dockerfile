FROM ruby:2.1-alpine

MAINTAINER Tim Flapper <tim@springest.com>

ENV LANG      en_US.UTF-8
ENV LANGUAGE  en_US.UTF-8
ENV LC_ALL    en_US.UTF-8

RUN apk add --no-cache \
		curl \
		autoconf \
	    g++ \
	    gcc \
	    libc6-compat \
	    make \
	    patch \
	    libbz2 \
	    curl-dev \
	    libevent \
	    libffi \
	    glib \
	    ncurses-dev \
	    readline-dev \
	    sqlite-dev \
	    openssl-dev \
	    libxml2-dev \
	    libxslt \
	    libyaml \
	    zlib-dev \
	    git \
	    imagemagick-dev \
	    jpeg-dev \
	    procps \
	    gdbm-dev \
	    tidyhtml-dev \
	    libev \
	    openssl \
	    python \
	    python-pip \
	    supervisor \
	    postgresql-dev && \

	# Setup Rubygems
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler && gem update --system && \

    # Install AWS CLI
    pip install awscli awsebcli
