# Initial Setup:

(All as `root` user)

Install Ansible:

```
pip3 install ansible
```

Install requirements:

```
ansible-pull -U https://github.com/heywoodlh/ansible setup.yml
```

One-time run:

```
ansible-pull -U https://github.com/heywoodlh/ansible playbooks/servers/server.yml 
```

Make the job recurring:

```
ansible-pull -U https://github.com/heywoodlh/ansible playbooks/servers/bootstrap/cron.yml
```

## Configure Gotify CLI:

Make sure to configure the Gotify CLI so alerts go out:

```
gotify init
```
