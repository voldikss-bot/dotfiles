#! /usr/bin/env bash

if ! command -v nodejs; then
    curl -LO install-node.now.sh/lts
    sudo bash ./lts --yes
    rm ./lts
fi
