#!/bin/sh
# Set the DWM status bar text to the remaining battery capacity
# (if the machine has a battery) and the current time.

print_date() {
  date +"%H:%M"
}

print_battery() {
	FILE=/sys/class/power_supply/BAT1/capacity
	if [ -f "$FILE" ]; then
		charge="$(cat "$FILE")"
		echo " ${charge}%"
	fi
}


while true
do
  xsetroot -name "$(print_battery) $(print_date)"
  sleep 2
done
