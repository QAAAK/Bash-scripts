#!/bin/bash

set -uexo pipefail;

echo "AbraKadabra" | mail -s "Test mail" master@dmosk.ru,shmaster@dmosk.ru
