#!/bin/bash

while read -r magnet; do
	transmission-cli -w ./vids "$magnet" #&
done < ./magnet_links/magnet_links.txt

while true; do
	sleep 60
	if transmission-remote -l | grep -q -v "100%"; then
		echo "Downloads still in progress..."
	else
		echo "All downloads complete"
		break
	fi
done
