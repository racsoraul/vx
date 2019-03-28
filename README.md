# Ansible
## Setup
On center of control:
```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

On each target node:
```
setup_host.sh
```

## Execute remote configuration
```
sudo -E ansible-playbook config/local.yml -i inventory --ask-become-pass
```

# IFPS and IPDR setup
```
./setup.sh
cd services
docker-compose up -d
```
