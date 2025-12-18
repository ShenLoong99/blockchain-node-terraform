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
  --syncmode snap \
  --http \
  --http.addr 127.0.0.1 \
  --http.port 8545 \
  --http.api eth,net,web3 \
  > /var/log/geth.log 2>&1 &
