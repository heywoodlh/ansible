#!/usr/bin/env bash

working_dir=$(pwd)

for server in $(cat servers.txt)
do
	shortname=$(echo ${server} | cut -d'.' -f1)
	ssh -tt ${server} bash -c "'
	if sudo test -f /root/tarsnap.key
	then
		sudo cp /root/tarsnap.key /tmp/${shortname}-tarsnap.key
		sudo chown -R 1000 /tmp/${shortname}-tarsnap.key	
	fi
	'"
	scp ${server}:/tmp/${shortname}-tarsnap.key ${working_dir}
	ssh ${server} rm /tmp/${shortname}-tarsnap.key
done

tar czvf tarsnap-keys.tar.gz *-tarsnap.key

gpg -r l.spencer.heywood@protonmail.com --encrypt tarsnap-keys.tar.gz

rm *-tarsnap.key
rm tarsnap-keys.tar.gz
