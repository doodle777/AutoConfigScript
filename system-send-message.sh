#!/bin/bash
##向特定用户发送消息
#
###########################
#
# Save the username parameter
#
muser=$1
#
# Determine if user is logged on:
#
logged_on=$(who | grep -i -m 1 $muser | gawk '{print $1}')
#
if [ -z $logged_on ]
then
	echo "$muser is not logged on."
	echo "Exiting scrpt..."
	exit
fi
#
# Determine if user allows messaging:
#
allowed=$(who -T | grep -i -m 1 $muser | gawk '{print $2}')
#
if [ $allowed != "+" ]
then
	echo "$muser does not allowing messaging."
	echo "Exiting script..."
	exit
fi
#
# Determine if a message was included:
#
if [ -z $2 ]
then
	echo "No mesage parameter included."
	echo "Exiting script..."
	exit
fi
#
# Determine if there is more to thr message:
#
shift
#
while [ -n "$1" ]
do
	whole_mesage=$whole_message' '$1
	shift
done
#
# Send messafe to user:
#
uterminal=$(who | grep -i -m 1 $muser | gawk '{print $2}')
#
echo $whole_message | write $logged_on $uterminal
#
exit
