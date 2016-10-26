#!/bin/bash
zenity --forms --title="Add Member" \
	--text="Enter information about the member:" \
	--separator="|" \
	--add-entry="First Name" \
	--add-entry="Middle Name" \
	--add-entry="Last Name" \
	--add-entry="Email" \
	--add-entry="Address-Line 1" \
	--add-entry="Address-Line 2" \
 	--add-entry="Address-Line 3" \
	--add-entry="Address-Line 4" \
	--add-entry="Phone number +91" \
	--add-entry="Father's Name" \
	--add-entry="Mother's Name" \
	--add-entry="Nationality" \
	--add-entry="Blood Group" \
	--add-entry="Branch" \
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

flag=0
	while((flag==0))
	do
		id=$(($RANDOM%10000+1))
		echo $id
		count=$(cut -d \| -f 1 file.txt | grep $id |wc -l)
		if((count==0))
		then
			flag=1
		fi
	done
echo $id >> file.txt
