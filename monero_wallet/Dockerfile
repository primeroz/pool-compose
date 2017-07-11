FROM local/monerod:mainnet

COPY docker-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh

WORKDIR /wallet

# Contains Wallet file
VOLUME /wallet

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
