#!/bin/bash

if [ "${TESTNET}" == "true" ]; then
  exec /usr/local/bin/monero-wallet-rpc --testnet --trusted-daemon --wallet-file $WALLET_FILE --password $WALLET_PASSWORD --rpc-bind-port $RPC_BIND_PORT --disable-rpc-login --rpc-bind-ip $RPC_BIND_IP --confirm-external-bind --daemon-address monerod:28081
else
  exec /usr/local/bin/monero-wallet-rpc --trusted-daemon --wallet-file $WALLET_FILE --password $WALLET_PASSWORD --rpc-bind-port $RPC_BIND_PORT --disable-rpc-login --rpc-bind-ip $RPC_BIND_IP --confirm-external-bind --daemon-address monerod:18081
fi
