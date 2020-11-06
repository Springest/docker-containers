FROM ubuntu:18.04
MAINTAINER Springest <developers@springest.com>

RUN printf "path-exclude /usr/share/doc/*\npath-exclude /usr/share/man/*\npath-exclude /usr/share/info/*\npath-exclude /usr/share/lintian/*" >> /etc/dpkg/dpkg.cfg.d/nodoc && \
    cd /usr/share && rm -fr doc/* man/* info/* lintian/*

ENV LANG      en_US.UTF-8
ENV LANGUAGE  en_US.UTF-8
ENV LC_ALL    en_US.UTF-8

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q && apt-get install -yq --no-install-recommends ca-certificates apt-transport-https gnupg locales curl && \
    locale-gen en_US.UTF-8 && \
    echo deb https://apt.fullstaqruby.org ubuntu-18.04 main > /etc/apt/sources.list.d/fullstaq-ruby.list && \
    curl -SLfO https://raw.githubusercontent.com/fullstaq-labs/fullstaq-ruby-server-edition/main/fullstaq-ruby.asc && \
    apt-key add fullstaq-ruby.asc && \
    apt update && \
    apt-get install -yq --no-install-recommends fullstaq-ruby-2.6.5-jemalloc

# Pick up new ruby/gem binaries
ENV PATH="/usr/lib/fullstaq-ruby/versions/2.6.5-jemalloc/bin:${PATH}"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 ABF5BD827BD9BF62 && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main > /etc/apt/sources.list.d/pgdg.list && \
    echo deb http://nginx.org/packages/ubuntu/ bionic nginx > /etc/apt/sources.list.d/nginx.list && \
    echo deb http://deb.nodesource.com/node_14.x bionic main > /etc/apt/sources.list.d/nodesource.list && \
    echo deb http://dl.yarnpkg.com/debian/ stable main > /etc/apt/sources.list.d/yarn.list && \
    mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \
    curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    curl -s https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main >> /etc/apt/sources.list.d/google.list && \
    apt-get update -q && apt-get upgrade -yq --no-install-recommends && \
      apt-get install -yq --no-install-recommends \
      tzdata \
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
      libgconf-2-4 \
      libglib2.0-dev \
      libncurses-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libxml2-dev \
      libxslt-dev \
      libyaml-dev \
      zlib1g-dev \
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
      nodejs \
      openssl \
      postgresql-11 \
      postgresql-contrib-11 \
      postgresql-client-11 \
      unzip \
      yarn \
      google-chrome-stable \
      libpq-dev \
      nginx \
      python-dev \
      ghostscript \
      poppler-utils \
      tesseract-ocr && \
    rm -rf /usr/share/man/man1 && \
    rm -rf /usr/share/man/man7 && \
    \
    # Setup Rubygems
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler && \
    \
    # Install AWS CLI to local user
    curl -s "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -b ~/bin/aws && \
    rm awscli-bundle.zip && \
    rm -r awscli-bundle && \
    \
    # Update ImageMagick policy to allow `convert` to convert PDF files to TIFF for OCR
    sed -i 's+<policy domain="coder" rights="none" pattern="PDF" />+<policy domain="coder" rights="read" pattern="PDF" />+g' /etc/ImageMagick-6/policy.xml && \
    \
    # clean up
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log

RUN mkdir -p /data && chown postgres: /data
RUN su postgres -c "PGDATA=/data /usr/lib/postgresql/11/bin/initdb"
