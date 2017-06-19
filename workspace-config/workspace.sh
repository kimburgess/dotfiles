#!/bin/sh
# Workspace setup for when moving between locations

INT=eDP1
EXT=DP2

setup_office() {
    xrandr \
        --output $INT --mode 3840x2160 --scale 0.7x0.7 \
        --output $EXT --mode 3840x2160 --right-of $INT
    xbacklight -set 100 -time 600
}

setup_home() {
    xrandr \
        --output $INT --mode 3840x2160 --scale 0.7x0.7 \
        --output $EXT --mode 3840x2160 --above $INT
    xbacklight -set 80 -time 600
}
setup_mobile() {
    xrandr \
        --output $INT --mode 3840x2160 --scale 0.7x0.7 \
        --output $EXT --off
    xbacklight -set 60 -time 600
}

set -eo pipefail

case "$1" in
    office)     setup_office;;
    home)       setup_home;;
    mobile)     setup_mobile;;
    "")         echo "Usage: ./workspace <office|mobile|home>" && exit 1;;
    *)          echo "No workspace setup defined for $1" && exit 1;;
esac
