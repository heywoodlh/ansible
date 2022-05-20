#!/usr/bin/env bash

command="$@"

for server in $(cat servers.txt)
do
	shortname=$(echo ${server} | cut -d'.' -f1)
	ssh -tt ${server} bash -c "'
	${command}
	'"
done
