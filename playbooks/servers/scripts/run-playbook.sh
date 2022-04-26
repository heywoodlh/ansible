#!/usr/bin/env bash

for server in $(cat servers.txt)
do
	shortname=$(echo ${server} | cut -d'.' -f1)
	ssh -tt ${server} bash -c "'
	sudo ANSIBLE_LOG_PATH="/var/log/ansible.log" ansible-pull -U https://git.sr.ht/~heywoodlh/ansible playbooks/servers/server.yml
	'"
done
