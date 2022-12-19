#!/bin/sh
[ "$(whoami)" != "root" ] && printf "Run me as root.\n" && exit 1
command -v npm > /dev/null && npm i -g bash-language-server || printf "npm not available, won't install bash-language-server\n"
