#!/bin/bash

sed -i 's/dtparam=audio=on/#dtparam=audio=on/' /boot/config.txt 
printf "\n# Melopero DAC\ndtoverlay=hifiberry-dacplus\n" >> /boot/config.txt 


awk '
    BEGIN {
        dacplus=0
    }

    /^[^#]*dtparam=audio=on/ {
        print "#dtparam=audio=on"
    } 
    /^[^#]*ndtoverlay=hifiberry-dacplus/ {
        if (dacplus == 1) {
            next
        }
        else {
            print
            dacplus=1
        }

    END {
        if (dacplus == 0)
            print "\nMelopero DAC\ndtoverlay=hifiberry-dacplus\n"
    }'