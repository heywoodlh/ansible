## Setup:

Install `ansible` globally:

```
sudo pip3 install ansible
```

### Servers:

```
sudo ansible-pull -U https://github.com/heywoodlh/ansible setup.yml
sudo ansible-pull -U https://github.com/heywoodlh/ansible playbooks/servers/server.yml
```

### Workstations:

```
sudo ansible-pull -U https://github.com/heywoodlh/ansible setup.yml
sudo ansible-pull -U https://github.com/heywoodlh/ansible playbooks/workstation/workstation.yml
```
