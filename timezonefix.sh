# Scripts that performs the following steps
#1. Executes the date command, and extracts the timezone acronym
#2. If it matches the indicated one (i.e CEST), it will do nothing
#3. If it does not match, it will execute a command to set it to the current timezone in use for localhost
#!/bin/bash

date=$(date | cut -c 21-24);

datetrim=$(echo "$date" | tr -d '\n')

echo $datetrim;

if [ "$datetrim" = "CEST" ];then

	echo "igual"
else
	sleep 1
	sudo timedatectl set-timezone Europe/Madrid
	
fi
