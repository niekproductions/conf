#!/bin/sh
UPLOAD_DIR="https://domain.name/"

inotifywait -m /home/niek/Pictures/Screenshots -e create -e moved_to |
while read path action file; do
	FULLPATH=$path$file
	#echo "The file '$file' appeared in directory '$path' via '$action'"
	#echo "New file, uploading from '$FULLPATH'"
	#mintupload nefas $FULLPATH
	`sshpass -p "password" scp $FULLPATH user@host:path/`

	FILENAME=${FULLPATH##*/}
	echo -n $UPLOAD_DIR$FILENAME | xclip -sel clip
done
