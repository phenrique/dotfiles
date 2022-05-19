#!/bin/bash

#install packages

echo " - >>> Install pacman packages"
sudo pacman -Syyu $(cat ./pacman.txt)

echo " - >>> Install AUR packages"
yay -S $(cat ./aur.txt)

#keymapper
echo " - >>> enable keymapper"
systemctl start  keymapperd
systemctl enable keymapperd
