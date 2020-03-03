## Setup:

The playbooks in this repository are intended to run locally as a `sudo` user who can also run the `docker` command.

### Automatic Setup:

Run the `setup.yml` Ansible playbook to set things up automatically (if you're on a Debian or RHEL based Linux distribution).

```bash
git clone https://github.com/heywoodlh/ansible
cd ansible
ansible-playbook --ask-become-password setup.yml
```

### Manual Setup:

If you'd rather not use the `setup.yml` playbook, you need to do the following:

- Install Docker: `sudo apt-get install docker.io`
- Add your user to the `docker` group (log out of your session and then back in for the group change to apply): `sudo usermod -aG docker "${USER}"`
- Install the Docker Python 3 module: `sudo pip3 install docker`


## Using the Playbooks:

All of the playbooks for the applications are in the `playbooks` directory. 

Each of the variables pertinent to each application are stored in files in the `vars` directory of each playbook. Edit the files as needed per installation. 

An example deployment of BackupPC would follow this approach:

```bash
cd playbooks/backuppc
vim vars/backuppc.yml    ## For other applications make sure to edit all of the files in the vars directory

ansible-playbook --ask-become-pass backuppc.yml
```


This general pattern can be replicated for each application that is desired to be deployed.
