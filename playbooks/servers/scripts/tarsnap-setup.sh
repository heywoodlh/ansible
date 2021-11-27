#!/usr/bin/env bash

for server in $(cat servers.txt)
do
	shortname=$(echo ${server} | cut -d'.' -f1)
	ssh -tt ${server} bash -c "'
	if sudo test ! -f /root/tarsnap.key
	then
		sudo tarsnap-keygen \
		--keyfile /root/tarsnap.key \
		--user l.spencer.heywood@protonmail.com \
		--machine ${shortname}
	fi
	'"
done
