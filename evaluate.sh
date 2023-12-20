#! /bin/bash

read -p "Enter the path of a file/Directoy: " eval

if [ -e "$eval" ]; then
	if [ -f "$eval" ]; then
		echo "$eval is a regular file"
	fi
	if [ -r "$eval" ]; then
                echo "$eval is a readable file"
        fi    
	if [ -d "$eval" ]; then
                echo "$eval is a directory"
        fi
	if [ -w "$eval" ]; then
                echo "$eval is a writable file"
        fi
	if [ -x "$eval" ]; then
                echo "$eval is a executable file"
        fi
else
	echo "$eval does not exist"
	exit 1
fi
exit

