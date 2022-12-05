#!/usr/bin/env bash

# If Ubuntu-based (switched to Ubuntu for all my Powershell goodies)
if grep -q 'ID=ubuntu' /etc/os-release
then
	apt-get update && apt-get dist-upgrade -y
	apt-get install -y python3-pip vim git curl \
		&& echo 'Installed base packages' | tee -a /opt/setup.log

	pip3 install ansible
	ANSIBLE_LOG_PATH="/opt/ansible-setup.log" ansible-pull -U https://github.com/heywoodlh/ansible setup.yml \
		&& ANSIBLE_LOG_PATH="/opt/ansible-setup.log" ansible-pull -U https://github.com/heywoodlh/ansible playbooks/red-team/red-team.yml \
		&& echo 'Ran ansible playbooks' | tee -a /opt/setup.log
else
	echo "Please run this script on an Ubuntu machine!"
fi

