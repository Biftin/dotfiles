#!/bin/bash

gnome_schema=org.gnome.desktop.interface

function setting() {
  gsettings set "$gnome_schema" "$1" "$2"
}

setting gtk-theme    Adwaita
setting icon-theme   adwaita
setting cursor-theme Adwaita
