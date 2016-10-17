#!/bin/sh
ENTRY=`zenity --password --username`

case $? in
         0)
	 	echo "User Name: `echo $ENTRY | cut -d'|' -f1`"
	 	echo "Password : `echo $ENTRY | cut -d'|' -f2`"
		;;
         1)
                echo "Stop login.";;
        -1)
                echo "An unexpected error has occurred.";;
esac
FILE=`dirname $0`/COPYING.txt

zenity --text-info \
       --title="License" \
       --filename=$FILE \
       --checkbox="I read and accept the terms."

case $? in
    0)
        echo "Start installation!"
	# next step
	;;
    1)
        echo "Stop installation!"
	;;
    -1)
        echo "An unexpected error has occurred."
	;;
esac

zenity --forms --title="Personal Details" \
	--add-entry="First Name" \
	--add-calendar="Enter your date of birth: " >> addr.csv
	--separator="," \
	--add-entry="Enter your Qualification:" \
	--add-entry="Enter your Email ID:" \
	
case $? in
    0)
        echo "Friend added.";;
    1)
        echo "No friend added."
	;;
    -1)
        echo "An unexpected error has occurred."
	;;
esac


FILE=`zenity --file-selection --multiple --title="Upload your Caste and Income Certificate:"`
zenity --warning \
--text="Upload the legitimate documents."
case $? in
         0)
                echo "\"$FILE\" selected.";;
         1)
                echo "No file selected.";;
        -1)
                echo "An unexpected error has occurred.";;
esac
echo "10" ; sleep 1
echo "# Uploading your Caste certificate." ; sleep 1
echo "20" ; sleep 1
echo "# Uploading your Income Certificate." ; sleep 1
echo "50" ; sleep 1
echo "#Checking the upload" ; sleep 1
echo "75" ; sleep 1
echo "# Done" ; sleep 1
echo "100" ; sleep 1

zenity --progress \
  --title="Uploading required Certificates" \
  --text="Upload in Progress..." \
  --percentage=0

if [ "$?" = -1 ] ; then
        zenity --error \
          --text="Upload canceled."
fi



