#!/bin/bash

# Install Python requirements
sudo apt-get install python python-pip -y

# Install Kubespray requirements
pip install -r "$HOME/my-net/scripts/ansible/sol/kubespray/requirements.txt"

# Bootstrap OS'en
ansible-playbook --ask-become-pass -b -i "$HOME/my-net/files/ansible/hosts" "$HOME/my-net/scripts/ansible/bootstrap-k8s-bastion-remote.yml"
ansible-playbook --ask-become-pass -b -i "$HOME/my-net/files/ansible/hosts" "$HOME/my-net/scripts/ansible/bootstrap-k8s-bastion-local.yml"
ansible-playbook --ask-become-pass -b -i "$HOME/my-net/files/ansible/hosts" "$HOME/my-net/scripts/ansible/bootstrap-k8s-cluster.yml"

# Install Kubespray
echo "ansible-playbook --ask-become-pass -b -i '$HOME/my-net/files/ansible/hosts' '$HOME/my-net/scripts/ansible/sol/kubespray/cluster.yml'"