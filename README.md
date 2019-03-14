## Ansible setup
```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

### Inventory
```
[all]
10.0.0.70
10.0.0.50
...

[all:vars]
ansible_python_interpreter=/usr/bin/python3
```

## Execute remote configuration
```
sudo -E ansible-playbook config/local.yml -i inventory --ask-become-pass
```