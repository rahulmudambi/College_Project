#!/bin/bash

#Welcome Dialog
zenity --info \
	--title="E-governance" \
	--text="Welcome to the E-governance System!" \
	--width=300 \
	--height=100 \
	--timeout=5 \

#initially input = 1 to start the loop
input=1
while [ $input -ne 4 ]
do
	#Menu Dialog
	#The option chosen is stored in the variable input
	input=$(zenity --list \
		--title="Menu:" \
		--column="Choise" \
		--column="Description" \
		1 Add \
		2 Delete \
		3 Display \
		4 Exit )
	#If cancel is pressed then the zenity command returns 1
	if [ $? -eq 1 ]
	then
		input=0
		zenity --error \
			--text="Select option 4 to exit ! :)"
	fi
	case $input in
		1)
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
					flag=0
       					while [ $flag == 0 ]
       					do
						#$RANDOM function generates a random number which ranges from 0 to 32,767
     				        	id=$(echo "$RANDOM+1" | bc) 
  				                echo $id
 				                count=$(cut -d \| -f 1 id_file | grep $id |wc -l)
						echo $count
                		 		if [ $count == 0 ]
               					then
                			        	flag=1
             					fi
        				done
					echo "Member id : $id"
					;;
				1)
					echo "No Member added!"
					;;
				-1)
					echo "An error has occurred!"
					;;
			esac
			;;
		2)
			cut -d \| -f 1 file.txt | paste id_file - >> id_name.csv
			zenity --list \
				--title="Delete Member" \
				--text="Choose the member whose data must be deleted:" \
				--column="I.D." \
				--column="Name" \
				$(tr '\n\t' '  ' < id_name.csv)
			;;
		3)
			;;
		4)
			echo "BYE!"
			;;
		*)
			echo "An error has occured!"
			;;
	esac
done
