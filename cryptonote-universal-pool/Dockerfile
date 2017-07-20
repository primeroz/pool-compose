FROM ubuntu:16.04

WORKDIR /tmp

RUN set -ex && apt-get update -y
RUN set -ex && apt-get install -y software-properties-common python-software-properties
RUN set -ex && add-apt-repository ppa:bitcoin/bitcoin
RUN set -ex && apt-get install -y build-essential \
                                  libtool \
                                  autotools-dev \
                                  autoconf \
                                  pkg-config \
                                  libssl-dev \
                                  libboost-all-dev \
                                  git \
                                  nodejs \
                                  npm \
                                  nodejs-legacy \
                                  libminiupnpc-dev \
                                  curl \
                                  libdb4.8-dev \
                                  libdb4.8++-dev

RUN set -ex && curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh > /tm
p/install.sh \
            && sh /tmp/install.sh \
            && export NVM_DIR="/root/.nvm" && . $NVM_DIR/nvm.sh \
            && nvm install 0.10.25

RUN set -ex && export NVM_DIR="/root/.nvm" && . $NVM_DIR/nvm.sh \
            && nvm use 0.10.25  \
            && git clone https://github.com/sk1tt1sh/cryptonote-universal-pool.git pool \
            && cd /tmp/pool \
            && npm update

RUN set -ex && mv /tmp/pool /cryptonote-universal-pool

RUN set -ex && apt-get -qq --auto-remove purge $buildDeps
RUN set -ex && apt-get --auto-remove purge -y build-essential \
                                              autotools-dev \
                                              libssl-dev \
                                              libboost-all-dev \
                                              libminiupnpc-dev \
                                              libdb4.8-dev \
                                              libdb4.8++-dev

RUN set -ex && apt-get purge -y --auto-remove \
            && apt-get clean \
            && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY runpool.sh /runpool.sh
RUN chmod a+x /runpool.sh

WORKDIR /

# Contains the blockchain
VOLUME /pool

EXPOSE 8117 3333 5555 7777 8888

ENTRYPOINT [ "/runpool.sh" ]
