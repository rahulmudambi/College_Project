#!/bin/bash
zenity --forms --title="Add Member" \
	--text="Enter information about the member:" \
	--separator="|" \
	--add-entry="First Name" \
	--add-entry="Middle Name" \
	--add-entry="Last Name" \
	--add-entry="Email" \
	--add-calendar="Date-of-birth" >> file.txt

case $? in
	0) 
		echo "Member added!"
		;;
	1)
		echo "No Member added!"
		;;
	-1)
		echo "An error has occurred!"
		;;
esac
