#!/bin/bash
# Generate PhoneGap icon and splash screens.
# Copyright 2013 Tom Vincent <http://tlvince.com/contact>
# http://www.imagemagick.org/Usage/color_mods/#grayscale
# usage: ./gen_icon.sh app_icon.png "RGB(238,238,238)"

usage() { echo "usage: $0 icon colour [dest_dir]"; exit 1; }

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

devices=android,ios
eval mkdir -p "$3/res/{icon,screen}/{$devices}"

# Show the user some progress by outputing all commands being run.
set -x


# Explicitly set background in case image is transparent (see: #3)
# icon
convert="convert -background none"
$convert "$1" -resize 128x128 "$3/res/icon/icon.png"
$convert "$1" -resize 36x36 "$3/res/icon/android/icon-36-ldpi.png"
$convert "$1" -resize 72x72 "$3/res/icon/android/icon-72-hdpi.png"
$convert "$1" -resize 48x48 "$3/res/icon/android/icon-48-mdpi.png"
$convert "$1" -resize 96x96 "$3/res/icon/android/icon-96-xhdpi.png"
$convert "$1" -resize 29x29 "$3/res/icon/ios/icon-29.png"
$convert "$1" -resize 40x40 "$3/res/icon/ios/icon-40.png"
$convert "$1" -resize 50x50 "$3/res/icon/ios/icon-50.png"
$convert "$1" -resize 57x57 "$3/res/icon/ios/icon-57.png"
$convert "$1" -resize 58x58 "$3/res/icon/ios/icon-58.png"
$convert "$1" -resize 72x72 "$3/res/icon/ios/icon-72.png"
$convert "$1" -resize 76x76 "$3/res/icon/ios/icon-76.png"
$convert "$1" -resize 80x80 "$3/res/icon/ios/icon-80.png"
$convert "$1" -resize 100x100 "$3/res/icon/ios/icon-100.png"
$convert "$1" -resize 114x114 "$3/res/icon/ios/icon-114.png"
$convert "$1" -resize 120x120 "$3/res/icon/ios/icon-120.png"
$convert "$1" -resize 152x152 "$3/res/icon/ios/icon-152.png"

# screen
convert="convert $1 -background $2 -gravity center"
$convert -resize 128x128 -extent 320x200 "$3/res/screen/android/drawable-land-ldpi-screen.png"
$convert -resize 256x256 -extent 480x320 "$3/res/screen/android/drawable-land-mdpi-screen.png"
$convert -resize 256x256 -extent 800x480 "$3/res/screen/android/drawable-land-hdpi-screen.png"
$convert -resize 512x512 -extent 1280x720 "$3/res/screen/android/drawable-land-xhdpi-screen.png"
$convert -resize 512x512 -extent 960x1600 "$3/res/screen/android/drawable-land-xxhdpi-screen.png"
$convert -resize 512x512 -extent 1920x1280 "$3/res/screen/android/drawable-land-xxxhdpi-screen.png"
$convert -resize 128x128 -extent 200x320 "$3/res/screen/android/drawable-port-ldpi-screen.png"
$convert -resize 256x256 -extent 320x480 "$3/res/screen/android/drawable-port-mdpi-screen.png"
$convert -resize 256x256 -extent 480x800 "$3/res/screen/android/drawable-port-hdpi-screen.png"
$convert -resize 512x512 -extent 720x1280 "$3/res/screen/android/drawable-port-xhdpi-screen.png"
$convert -resize 512x512 -extent 960x1600 "$3/res/screen/android/drawable-port-xxhdpi-screen.png"
$convert -resize 512x512 -extent 1280x1920 "$3/res/screen/android/drawable-port-xxxhdpi-screen.png"

$convert -resize 256x256 -extent 320x480 "$3/res/screen/ios/Default~iphone.png"
$convert -resize 256x256 -extent 640x960 "$3/res/screen/ios/Default@2x~iphone.png"
$convert -resize 256x256 -extent 768x1024 "$3/res/screen/ios/Default-Portrait~ipad.png"
$convert -resize 768x768 -extent 1536x2048 "$3/res/screen/ios/Default-Portrait@2x~ipad.png"
$convert -resize 512x512 -extent 1024x768 "$3/res/screen/ios/Default-Landscape~ipad.png"
$convert -resize 768x768 -extent 2048x1536 "$3/res/screen/ios/Default-Landscape@2x~ipad.png"
$convert -resize 256x256 -extent 640x1136 "$3/res/screen/ios/Default-568h@2x~iphone.png"
$convert -resize 256x256 -extent 750x1134 "$3/res/screen/ios/Default-667h.png"
$convert -resize 512x512 -extent 1242x2208 "$3/res/screen/ios/Default-736h.png"
$convert -resize 512x512 -extent 1208x1242 "$3/res/screen/ios/Default-Landscape-736h.png"

