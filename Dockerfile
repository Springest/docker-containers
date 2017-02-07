FROM ubuntu:14.04
MAINTAINER Tim Flapper <tim@springest.com>

# Inspired by cloudgear ubuntu image (https://github.com/cloudgear-images/ubuntu)
# Inspired by cloudgear ruby image (https://github.com/cloudgear-images/ruby)

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 && \
    # Don't install man documents for future packages and remove existing
    printf "path-exclude /usr/share/doc/*\npath-exclude /usr/share/man/*\npath-exclude /usr/share/info/*\npath-exclude /usr/share/lintian/*" >> /etc/dpkg/dpkg.cfg.d/nodoc && \
    cd /usr/share && rm -fr doc/* man/* info/* lintian/*

ENV LANG      en_US.UTF-8
ENV LANGUAGE  en_US.UTF-8
ENV LC_ALL    en_US.UTF-8

ENV RUBY_VERSION 2.3

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > /etc/apt/sources.list.d/pgdg.list && \
    mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \
    echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox-ruby-ng-trusty.list && \

    apt-get update -q && apt-get install -yq --no-install-recommends ca-certificates curl && \

    curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \

    apt-get update -q && apt-get install -yq --no-install-recommends \
      autoconf \
      g++ \
      gcc \
      libc6-dev \
      make \
      patch \
      libbz2-dev \
      libcurl4-openssl-dev \
      libevent-dev \
      libffi-dev \
      libglib2.0-dev \
      libncurses-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libxml2-dev \
      libxslt-dev \
      libyaml-dev \
      zlib1g-dev \
      ruby$RUBY_VERSION \
      ruby$RUBY_VERSION-dev \
      build-essential \
      git \
      imagemagick \
      libjpeg-dev \
      libmagickcore-dev \
      libmagickwand-dev \
      procps \
      libgdbm-dev \
      libtidy-dev \
      libev-dev \
      openssl \
      python-dev \
      python-pip \
      supervisor \
      postgresql-client-9.4 \
      libpq-dev && \

    rm -rf /usr/share/man/man1 && \
    rm -rf /usr/share/man/man7 && \

    # Setup Rubygems
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler && gem update --system && \

    # Install AWS CLI
    python -m pip install -U pip && \
    pip install awscli && \
    pip install awsebcli && \

    # Intall Phantomjs 2.1.1
    curl -OLk https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin && \
    rm -f phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    rm -rf phantomjs-2.1.1-linux-x86_64 && \

    # clean up
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log
