#!/bin/bash

# Takes a message that's been aggregated, moves it, and sends it.
# I thought it would be bigger than this. That's what she said.
# Needs gammu installed and setup, and a modem with service (obviously.)

# Checks a NFS mounted share for a file. If it exists, it moves it then sends it.
# Order of operations is so it doesn't clobber other processes writing to the file.

# If it can't reach the share, it dies with an error stored on the local machine.


dirloc="/mnt/some/dir/"	# remote share
errloc="/home/me/"		# local machine
filename="sms"			# obvious?
timestamp=$(date +%s)		
number="12345678900"
movename="$filename ""$timestamp"

if [ ! -d "$dirloc" ];
        then
                echo "$(date): Cannot reach drive." >> "$errloc""smserrlog.txt"
        else
if [ -f "$dirloc""$filename" ];
        then
                mv "$dirloc""$filename" "$dirloc""sent/""$movename"
                cat "$dirloc""sent/""$movename" | gammu sendsms TEXT "$number"
                echo "$(date): Sent $movename to $number" >> "$dirloc""smslog.txt"
fi
fi

exit
