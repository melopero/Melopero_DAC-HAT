#!/bin/bash

sed -i 's/dtparam=audio=on/#dtparam=audio=on/' /boot/config.txt 
printf "\n# Melopero DAC\ndtoverlay=hifiberry-dacplus\n" >> /boot/config.txt 
