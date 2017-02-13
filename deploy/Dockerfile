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

RUN mkdir -p /usr/share/man/man1 && mkdir -p /usr/share/man/man7 && \

    apt-get update -q && apt-get install -yq --no-install-recommends \
      ca-certificates curl \
      git \
      python-dev \
      python-pip \
      jq && \

    rm -rf /usr/share/man/man1 && \
    rm -rf /usr/share/man/man7 && \

    # Install AWS CLI
    python -m pip install -U pip && \
    pip install awscli && \
    pip install awsebcli && \

    # clean up
    rm -rf /var/lib/apt/lists/* && \
    truncate -s 0 /var/log/*log
