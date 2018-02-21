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

ENV RUBY_VERSION 2.4

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 ABF5BD827BD9BF62 && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > /etc/apt/sources.list.d/pgdg.list && \
    echo deb http://nginx.org/packages/ubuntu/ trusty nginx > /etc/apt/sources.list.d/nginx.list && \
    echo deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main > /etc/apt/sources.list.d/brightbox-ruby-ng-trusty.list && \
    mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \
    apt-get update -q && apt-get install -yq --no-install-recommends ca-certificates curl && \
    curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    curl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    echo deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main >> /etc/apt/sources.list.d/google.list && \
    apt-get update -q && apt-get upgrade -yq --no-install-recommends && \
    apt-get install -yq --no-install-recommends \
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
      postgresql-9.4 \
      postgresql-contrib-9.4 \
      postgresql-client-9.4 \
      unzip \
      google-chrome-stable \
      libpq-dev \
      nginx && \
    rm -rf /usr/share/man/man1 && \
    rm -rf /usr/share/man/man7 && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler && \
    curl -OLk https://chromedriver.storage.googleapis.com/2.32/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/bin/chromedriver && \
    rm -f chromedriver_linux64.zip && \
    # clean up
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log

RUN mkdir -p /data && chown postgres: /data
RUN su postgres -c "PGDATA=/data /usr/lib/postgresql/9.4/bin/initdb"

