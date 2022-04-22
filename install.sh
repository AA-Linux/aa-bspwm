#!/usr/bin/env bash

install_bspwm() {
    local _CONFIGDIR="$HOME"/.config
    local _BSPWMDIR=${_CONFIGDIR}/bspwm
    local _SXHKDDIR=${_CONFIGDIR}/sxhkd

    mkdir -p "$_BSPWMDIR" && mkdir -p "$_SXHKDDIR"

    # Copy specific config files

    install -Dm 755 `pwd`/files/.fehbg          "$HOME"
    install -Dm 644 `pwd`/files/.Xresources     "$HOME"
    install -Dm 644 `pwd`/files/.xsettingsd     "$HOME"

    cp -r `pwd`/files/.Xresources.d   "$HOME"

    # copy network manager for config
    cp -r `pwd`/files/networkmanager-dmenu "$_CONGIDIR"

    # copy window manager configs
    cp -r `pwd`/files/alacritty       "$_BSPWMDIR"
    cp -r `pwd`/files/polybar         "$_BSPWMDIR"
    cp -r `pwd`/files/rofi            "$_BSPWMDIR"
    cp -r `pwd`/files/themes          "$_BSPWMDIR"
    cp -r `pwd`/files/bin             "$_BSPWMDIR"
    cp -r `pwd`/files/dunstrc         "$_BSPWMDIR"
    cp -r `pwd`/files/picom.conf      "$_BSPWMDIR"
    chmod +x "$_BSPWMDIR"/bin/*
    chmod +x "$_BSPWMDIR"/rofi/bin/*
    chmod +x "$_BSPWMDIR"/themes/set-theme

    install -Dm 755 `pwd`/files/bspwmrc     "$_BSPWMDIR"/bspwmrc
    install -Dm 644 `pwd`/files/dunstrc     "$_BSPWMDIR"/dunstrc
    install -Dm 644 `pwd`/files/picom.conf  "$_BSPWMDIR"/picom.conf

    # copy keybinds config file
    install -Dm 644 `pwd`/files/sxhkdrc     "$_SXHKDDIR"
}
install_bspwm
