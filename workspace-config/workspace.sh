#!/bin/sh
# Workspace setup for when moving between locations

INT=eDP-1
EXT=DP-2

setup_office() {
    xrandr \
        --output $INT --mode 3840x2160 --pos 0x1920  \
        --output $EXT --mode 3840x2160 --pos 3840x0 --rotate left
    xbacklight -set 100 -time 600
    # set_rand_bg
}

setup_mobile() {
    xrandr --output $INT --off
    xrandr \
        --output $INT --mode 3840x2160 --primary \
        --output $EXT --off
    xbacklight -set 60 -time 600
    # set_rand_bg
}

rand_colour() {
    echo "#$(openssl rand -hex 3)"
}

set_rand_bg() {
    local grad=$(rand_colour)-$(rand_colour)
    convert \
        -size 3840x2160 \
        -define gradient:direction=NorthEast gradient:$grad \
        bg.png
    feh --bg-scale ./bg.png
}

set -eo pipefail

case "$1" in
    office)     setup_office;;
    mobile)     setup_mobile;;
    new-bg)     new_bg;;
    "")         echo "Usage: ./workspace <office|mobile>" && exit 1;;
    *)          echo "No workspace setup defined for $1" && exit 1;;
esac
