#!/bin/bash

set -uexo pipefail;

PGPASSWORD=**** psql -h HOST -U NAME -d NAME_DB -с "COMMAND"
