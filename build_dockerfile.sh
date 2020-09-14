#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Building datasense/spacy_v2_1_8:en_sm"
docker build -t datasense/spacy_v2_1_8:en_sm .

