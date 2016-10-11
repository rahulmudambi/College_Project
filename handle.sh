#!/bin/bash

echo -e "1)Insert\n2)Display\nEnter choice:"
read n
if((n==1))
then
	flag=0
	while((flag==0))
	do
		id=$(($RANDOM%10000+1))
		echo $id
		count=$(cut -d \| -f 1 database | grep $id |wc -l)
		if((count==0))
		then
			flag=1
		fi
	done
	echo "Enter name:"
	read name
	echo "Enter Address:"
	read profession
	echo -e "$id\t|$name\t|$profession" >> database
else
	read id
	key=$(cut -d \| -f 1 database | grep -n $id | cut -d : -f1)
	echo "Name:"
	echo $(head -$key database | tail -1 | cut -d \| -f2)
	echo "ADDRESS:"
	echo $(head -$key database | tail -1 | cut -d \| -f3)
fi
