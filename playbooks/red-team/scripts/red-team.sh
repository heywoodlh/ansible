#!/usr/bin/env bash

# If Arch Linux
if grep -q 'Arch Linux' /etc/os-release
then
	pacman -Syu --noconfirm ansible git vim python-pip curl mosh \
		&& echo 'Installed base packages' | tee -a /opt/setup.log
        ln -s /usr/bin/vim /usr/bin/vi
fi

# If Debian-based
if [[ -e /etc/debian_version ]]
then
	apt-get update && apt-get dist-upgrade -y
	apt-get install -y python3-pip vim git curl mosh \
		&& echo 'Installed base packages' | tee -a /opt/setup.log

	pip3 install ansible
fi

ansible-pull -U https://git.sr.ht/~heywoodlh/ansible setup.yml \
	&& ansible-pull -U https://git.sr.ht/~heywoodlh/ansible playbooks/red-team/red-team.yml \
	&& echo 'Ran ansible playbooks' | tee -a /opt/setup.log


sudo -u heywoodlh bash -c '
				directory="/home/heywoodlh/opt/conf"
				git clone https://git.sr.ht/~heywoodlh/conf ${directory} 
				dotfiles="${directory}/dotfiles"
				home_files="${directory}/home"
				dependencies="${directory}/dependencies"
				for file in ${dotfiles}/*
				do
					basename=$(basename ${file})
					filename="${HOME}/.${basename}"
					if [[ -e ${filename} ]]
					then
						mv -v ${filename} ${filename}.orig
					fi
					ln -sv ${file} ${filename}
				done

				for file in ${home_files}/*
				do
        				basename=$(basename ${file})
        				filename="${HOME}/${basename}"
        				if [[ -e ${filename} ]]
        				then
                				mv -v ${filename} ${filename}.orig
        				fi
        				ln -sv ${file} ${filename}
				done
				cd ${dotfiles}
				pip3 install --user peru
				python3 -m peru sync 
				echo 'source ~/.bash_profile' >> /home/heywoodlh/.bashrc
				'
chsh -s /bin/bash heywoodlh

reboot
