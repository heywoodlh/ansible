## Setup:

Install `ansible` globally:

```
sudo pip3 install ansible
```

### Servers:

```
curl -L 'https://raw.githubusercontent.com/heywoodlh/ansible/master/operator/requirements.yml' -o /tmp/requirements.yml
sudo ansible-galaxy install -r /tmp/requirements.yml
sudo ansible-pull -c local -U https://github.com/heywoodlh/ansible operator/roles/server/standalone.yml
```

### Workstations:

```
sudo ansible-pull -c local -U https://github.com/heywoodlh/ansible setup.yml
sudo ansible-pull -c local -U https://github.com/heywoodlh/ansible playbooks/workstation/workstation.yml
```
