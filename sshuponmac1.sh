#!/bin/bash

#The purpose of this script is to start SSH server only on your local network, you could just enable, but this is a security issue, for example: you could travel with your laptop to another place and
#it can happen that they brute force your ssh and access your system. In my case I use my gaming laptop for heavy things such virtualization and similar things and I connect it with my thin client laptop. 
#keep in mind that you need to secure your local WiFi network using difficult passwords and using wpa2 or more advanced method of authentification. For more advanced security you can use also ssh keys which
#is recommended for more security.


#Change MyRouterMac with your current router mac, before using the script, execute arp -a

MyRouterMac="11:22:33:44:55:66"
CheckedRouterMac=$( arp -a | awk '{ print $4 }' )
sshup=$( systemctl start ssh )
sshstatus=$( systemctl status ssh )

sleep 15 #The use of sleep is for starting purpose it may need time to connect to the device (WiFI or Ethernet) so the script can proced to check and start the ssh

if [ "$CheckedRouterMac" = "$MyRouterMac" ]; then

	$sshup
	sleep 4
	echo "$sshstatus"

	echo "#############################################################################"

	echo "SSH IS UP"

	echo "#############################################################################"


else
	echo "#############################################################################"
	echo "SSH IS NOT WORKING, if you are connected to other Device it's normal, otherwise CHECK IT"
	echo "#############################################################################"

fi
