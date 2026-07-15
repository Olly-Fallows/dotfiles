#! /bin/bash

echo "Creating Backup"
mkdir -p `pwd`/backup

cp -r ~/.config/hypr `pwd`/backup/hypr
cp -r ~/.config/nvim `pwd`/backup/nvim
cp -r ~/.config/rofi `pwd`/backup/rofi
cp -r ~/.config/waybar `pwd`/backup/waybar

rm -rf ~/.config/hypr
rm -rf ~/.config/nvim
rm -rf ~/.config/rofi
rm -rf ~/.config/waybar

echo "Creating Symlinks"
ln -sfn `pwd`/hypr/* ~/.config/hypr
ln -sfn `pwd`/nvim ~/.config
ln -sfn `pwd`/rofi ~/.config
ln -sfn `pwd`/waybar ~/.config

echo "Files Dotted"

echo "Triggering Reloads"
hyprctl reload

pkill waybar && hyprctl dispatch exec waybar
