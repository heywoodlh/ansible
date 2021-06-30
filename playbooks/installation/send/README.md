## Firefox Send

### Pre-requisites:

- [Docker installed](https://docs.docker.com/get-docker/)
- Python3 pip module installed (`sudo apt-get install -y python3-pip`)

### Standalone Installation:

Install necessary Python modules:

```bash
sudo pip3 install docker ansible
```

Clone the playbooks and move the send playbook to the `/opt/send` folder:

```bash
git clone https://github.com/heywoodlh/ansible /tmp/ansible
sudo mv /tmp/ansible/playbooks/send /opt/send &&\
	sudo chown -R $USER:$USER /opt/send

rm -rf /tmp/ansible
```

Edit the variables, then deploy Send:

```bash
cd /opt/send

vim vars/send.yml

ansible-playbook --ask-become-pass send.yml
```
