#! /bin/bash
sudo dnf install git ansible -y

cd /tmp/

git clone --single-branch --branch terraform-ansible https://github.com/MMahiketh/ans-roles-proj.git

cd ansible-roles-proj/

export ANSIBLE_HOST_KEY_CHECKING=False

ansible-playbook mysql.yml -e ansible_password=DevOps321 -e MYSQL_PASS=ExpenseApp@1
ansible-playbook backend.yml -e ansible_password=DevOps321 -e MYSQL_PASS=ExpenseApp@1
ansible-playbook frontend.yml -e ansible_password=DevOps321