#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset


export TEST_API_KEY="abc123"
export STAGING_API_KEY="def456"
export PROD_API_KEY="ghi789"

.
ENV="${1}"


API_KEY="${ENV}_API_KEY"

echo "${API_KEY}=${!API_KEY}"
