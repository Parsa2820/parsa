#!/bin/bash

i3status | while :
do
        read line
	layout=$(xkblayout-state print %s)
        echo "$layout | $line" || exit 1
done
