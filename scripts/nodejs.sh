#! /usr/bin/env bash

echo "Installing nodejs..."

if ! command -v nodejs; then
    curl -LO install-node.now.sh/lts
    sudo bash ./lts --yes
    rm ./lts
fi
