#!/bin/bash

wget -O config-dac-awk https://raw.githubusercontent.com/melopero/Melopero_DAC-HAT/master/config-dac-awk
awk -f config-dac-awk /boot/config.txt > config.txt.tmp
cat config.txt.tmp > /boot/config.txt
rm config-dac-awk config.txt.tmp
rm config-dac.sh
