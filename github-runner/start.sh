#!/bin/bash

# Needs these env vars
# REPO=
# TOKEN=

./config.sh --url https://github.com/"$REPO" --token "$TOKEN"

# Graceful exit
cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token "$TOKEN"
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

# Start runner
./run.sh & wait $!
