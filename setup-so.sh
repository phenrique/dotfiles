#!/bin/bash

#install packages

echo " - >>> Install pacman packages \n"
sudo pacman -Syyu $(cat ./pacman.txt)

echo " - >>> Install AUR packages"
yay -S $(cat ./aur.txt)

#keymapper
echo " - >>> enable keymapper"
systemctl start  keymapperd
systemctl enable keymapperd

echo " - >>> Install snap"
sudo pacman -S snapd
sudo systemctl start snapd
sudo systemctl enable snapd
