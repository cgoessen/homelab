#!/bin/sh
# source list https://github.com/StevenBlack/hosts

echo "server:" >denylist.conf
curl -s https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts | \
        grep ^0.0.0.0 - | \
        grep -v "^0.0.0.0 0.0.0.0" - | \
        sed 's/ #.*$//;
        s/^0.0.0.0 \(.*\)/  local-zone: "\1" refuse/' \
        >>denylist.conf
