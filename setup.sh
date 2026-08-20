#!/usr/bin/bash

source /etc/os-release

if [[ "$ID" != "fedora" ]]; then
  echo "This script requires Fedora."
  exit 1
fi
