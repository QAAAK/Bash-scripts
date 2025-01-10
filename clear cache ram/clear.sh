#!/bin/bash

cache=$(free -m | grep Mem | awk '{print $6}')

echo "Cache $cache MB"

if [ $cache -ge 1000 ]
then
  echo "cache > 1 GB"
  echo ""
  read -p "Ready? Y/n: " ansver
    case $ansver in
    [y,Y])
      echo "please password"
      sudo echo "it was occupied by memory"
      free -m
      sync
      echo 1 | sudo tee -a /proc/sys/vm/drop_caches
      sync
      echo 2 | sudo tee -a /proc/sys/vm/drop_caches
      sync
      echo 3 | sudo tee -a /proc/sys/vm/drop_caches
      free -m;;
    [n,N])
      echo "Exit";;
    esac
else
  echo "enough free memory"
fi
