#!/bin/bash

sudo kill -9 $(lsof /home | awk '{print $2}')
sudo find /home/* -maxdepth 1 -type l | sudo xargs rm
sudo umount /home && sudo rm -rf /home
sudo ln -s /data/home /home
