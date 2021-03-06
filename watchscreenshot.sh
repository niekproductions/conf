#!/bin/sh
UPLOAD_DIR="https://domain.name/"

inotifywait -m /home/niek/Pictures/Screenshots -e close_write -e moved_to |
while read path action file; do
	FULLPATH=$path$file
	`scp -i identfile $FULLPATH user@host:path/`
	rc=$?

	if [ $rc != 0 ]; then
		notify-send -u low -t 2000 "Failed to upload screenshot!"
		return
	fi

	FILENAME=${FULLPATH##*/}
	echo -n $UPLOAD_DIR$FILENAME | xclip -sel clip
	notify-send -u low -t 2000 "Copied '$UPLOAD_DIR$FILENAME' to clipboard"
done
