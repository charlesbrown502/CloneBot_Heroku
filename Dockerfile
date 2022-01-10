FROM ubuntu:18.04

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
    git locales python3-lxml python3 python3-pip \
    aria2 curl pv jq nginx npm && \
    locale-gen en_US.UTF-8 && \
    curl -fsSLO https://raw.githubusercontent.com/MsGsuite/CloneBot_Heroku/main/requirements.txt && \
    pip3 install --no-cache-dir -r requirements.txt && \
    rm requirements.txt && \
    apt-get -qq purge git && \
    apt-get -qq -y autoremove --purge && \
    apt-get -qq -y clean && \
    rm -rf -- /var/lib/apt/lists/* /var/cache/apt/archives/*

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

WORKDIR /usr/src/app
COPY . .

RUN chmod 777 /usr/src/app && \
    chmod +x start.sh gclone

CMD ["bash", "start.sh"]
