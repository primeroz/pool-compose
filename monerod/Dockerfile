FROM ubuntu:16.04

RUN set -x \
  && buildDeps=' \
      ca-certificates \
      cmake \
      g++ \
      git \
      libboost1.58-all-dev \
      libssl-dev \
      make \
      pkg-config \
  ' \
  && apt-get -qq update \
  && apt-get -qq --no-install-recommends install $buildDeps wget

ENV SRC_DIR /usr/local/src/monero
ENV GIT_REPO https://github.com/monero-project/monero.git
ENV GIT_TAG v0.10.3.1

RUN git clone $GIT_REPO $SRC_DIR

WORKDIR $SRC_DIR

RUN git checkout tags/$GIT_TAG
RUN make -j$(nproc) release-static

RUN cp build/release/bin/* /usr/local/bin/ \
  \
  && rm -r $SRC_DIR \
  && apt-get -qq --auto-remove purge $buildDeps

RUN set -ex && apt-get purge -y --auto-remove \
        && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh

WORKDIR /root/.bitmonero

# Contains the blockchain
VOLUME /root/.bitmonero

# Contains Wallet file
VOLUME /wallet

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
