#!/bin/bash  

handle_error() {
  echo "Error on line $1"
  exit 1
}

trap 'handle_error $LINENO' ERR

mkdir /root/test_dir
echo "Directory created successfully."
