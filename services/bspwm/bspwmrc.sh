#!/bin/sh

# sxhkd -c /home/adachi/bspwm_config/sxhkdrc &

bspc monitor -d I II III IV V VI VII VIII IX X

bspc config border_width         2
bspc config window_gap          10

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

bspc config focused_border_color "#d9215b"
bspc config normal_border_color "#ffffff"

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a xst-256color:xst-calendar state=floating focus=off monitor='eDP1'
bspc rule -a xst-256color:xst-nmtui state=floating focus=on

nitrogen --restore
startPolybar
lxappearance & sleep 0.5 && killall lxappearance
