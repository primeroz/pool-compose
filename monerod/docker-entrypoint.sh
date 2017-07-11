#!/bin/bash
set -x

# Bootstrap from blockchain.raw
cd /root/.bitmonero
if [ ! -d "lmdb" ]; then
  if [ "${BLKCHAIN_BOOTSTRAP}" == "true" ]; then
    wget -c --progress=bar https://downloads.getmonero.org/blockchain.raw
    /usr/local/bin/monero-blockchain-import --verify ${BLKCHAIN_VERIFY} --input-file ./blockchain.raw --data-dir /root/.bitmonero
    rm -f ./blockchain.raw
  fi
fi


if [ "${TESTNET}" == "true" ]; then
  exec /usr/local/bin/monerod --testnet --testnet-data-dir /root/.bitmonero --log-level=$LOG_LEVEL --p2p-bind-ip=$P2P_BIND_IP --p2p-bind-port=$P2P_BIND_PORT --rpc-bind-ip=$RPC_BIND_IP --rpc-bind-port=$RPC_BIND_PORT --confirm-external-bind  2>&1
else
  exec /usr/local/bin/monerod --data-dir /root/.bitmonero --log-level=$LOG_LEVEL --p2p-bind-ip=$P2P_BIND_IP --p2p-bind-port=$P2P_BIND_PORT --rpc-bind-ip=$RPC_BIND_IP --rpc-bind-port=$RPC_BIND_PORT --confirm-external-bind  2>&1
fi
