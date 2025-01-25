#!/bin/bash

set -uexo pipefail;

echo "How long to wait?"
read time
sleep $time
echo "Waited for $time seconds!"
