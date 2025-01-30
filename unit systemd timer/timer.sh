#!/bin/bash

[Unit]
Description=Example Test Service
[Service]
Type=oneshot
ExecStart=/usr/bin/logger -p local3.debug I\'m a logger