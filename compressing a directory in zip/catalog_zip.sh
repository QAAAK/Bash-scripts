#!/bin/sh

set -uexo pipefail;

tar -czf "../${PWD##*/}.tar.gz" .
