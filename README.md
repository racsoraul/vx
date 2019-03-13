```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

```
. setup.sh
sudo -E ansible-playbook config/local.yml --ask-become-pass
```