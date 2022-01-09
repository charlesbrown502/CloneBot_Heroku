FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
    git python3 python3-pip \
    locales python3-lxml aria2 \
    curl pv jq nginx npm && \
    apt-get -qq purge git && \
    locale-gen en_US.UTF-8 \
    && apt-get -qq -y autoremove --purge \
    && apt-get -qq -y clean \
    && rm -rf -- /var/lib/apt/lists/* /var/cache/apt/archives/*

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /usr/src/app
COPY . .

RUN chmod 777 /usr/src/app && \
    pip3 install --no-cache-dir -r requirements.txt && \
    chmod +x start.sh gclone
CMD ["bash","start.sh"]
