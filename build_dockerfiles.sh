#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Building spacy base"
docker build -t spacy_base .

echo "Building spacy:en_sm"
docker build -t spacy:en_sm . -f "$SCRIPT_DIR/docker/en/Dockerfile.sm"