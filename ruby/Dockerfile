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

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C3173AA6 && \
    echo deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main > /etc/apt/sources.list.d/pgdg.list && \
    mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \
    curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
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
      imagemagick \
      libjpeg-dev \
      libmagickcore-dev \
      libmagickwand-dev \
      procps \
      libgdbm-dev \
      libtidy-dev \
      libev-dev \
      openssl \
      supervisor \
      postgresql-client-11 \
      libpq-dev \
      ghostscript \
      poppler-utils \
      tesseract-ocr \
      clamav-daemon \
      clamdscan && \
    rm -rf /usr/share/man/man1 && \
    rm -rf /usr/share/man/man7 && \
    \
    # Setup Rubygems
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler && \
    \
    # Update ImageMagick policy to allow `convert` to convert PDF files to TIFF for OCR
    sed -i 's+<policy domain="coder" rights="none" pattern="PDF" />+<policy domain="coder" rights="read" pattern="PDF" />+g' /etc/ImageMagick-6/policy.xml && \
    \
    # clean up
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log
