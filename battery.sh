#!/bin/sh
 [ $(cat /sys/class/power_supply/BAT1/status) = "Charging" ] ||
	[ $(cat /sys/class/power_supply/BAT1/status) = "Full" ] &&
	printf " %s%%" $(cat /sys/class/power_supply/BAT?/capacity) ||
	printf " %s%%" $(cat /sys/class/power_supply/BAT?/capacity)
