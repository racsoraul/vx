```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

```
cd config/
. setup.sh
sudo -E ansible-playbook local.yml
```