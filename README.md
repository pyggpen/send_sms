# send_sms
A short script to read a file and send it's contents.

Takes a message that's been aggregated, moves it, and sends it.
I thought it would be bigger than this. That's what she said.
Needs gammu installed and setup, and a modem with service (obviously.)

Checks a NFS mounted share for a file. If it exists, it moves it then sends it.
Order of operations is so it doesn't clobber other processes writing to the file.

If it can't reach the share, it dies with an error stored on the local machine.
