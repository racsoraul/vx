## Ansible setup
```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

## Execute remote configuration
```
sudo -E ansible-playbook config/local.yml -i inventory --ask-become-pass
```