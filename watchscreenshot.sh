#!/bin/sh
UPLOAD_DIR="https://domain.name/"

inotifywait -m /home/niek/Pictures/Screenshots -e create -e moved_to |
while read path action file; do
	FULLPATH=$path$file
	sleep 1
	`sshpass -p "password" scp $FULLPATH user@host:path/`

	FILENAME=${FULLPATH##*/}
	echo -n $UPLOAD_DIR$FILENAME | xclip -sel clip
	notify-send -u low -t 2000 "Copied '$UPLOAD_DIR$FILENAME' to clipboard"
done
