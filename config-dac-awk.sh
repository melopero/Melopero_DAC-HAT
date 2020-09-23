#!/bin/bash

awk '
    BEGIN {
        dacplus=0
    }

    {DEFAULT=1}

    /^[^#]*dtparam=audio=on/ {
        DEFAULT=0
        print "#dtparam=audio=on"
    } 
    /^[^#]*ndtoverlay=hifiberry-dacplus/ {
        DEFAULT=0
        if (dacplus == 1) {
            next
        }
        else {
            print
            dacplus=1
        }
    
    /^#Melopero DAC/ { DEFAULT=0 }

    DEFAULT {
        print
    }

    END {
        if (dacplus == 0)
            print "\nMelopero DAC\ndtoverlay=hifiberry-dacplus\n"
    }' /boot/config.txt