#!/bin/bash
set -e

apt update
apt install -y software-properties-common curl

add-apt-repository -y ppa:ethereum/ethereum
apt update
apt install -y ethereum

mkdir -p /var/lib/geth

nohup geth \
  --sepolia \
  --syncmode light \
  --http \
  --http.addr 0.0.0.0 \
  --http.port 8545 \
  --http.api eth,net,web3 \
  --http.corsdomain "*" \
  --http.vhosts "*" \
  --peer.discovery.dns \
  --maxpeers 50 \
  --verbosity 3 \
  > /var/log/geth.log 2>&1 &
