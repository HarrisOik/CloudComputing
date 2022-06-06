#!/bin/bash
myuser=user
date=$(date '+%Y-%m-%d_%H:%M')
key=${myuser}_${date}
mkdir ./tmp
mkdir ./files
ssh-keygen -b 2048 -t rsa -f ./tmp/${key} -q -N ""
cp ./tmp/${key}.pub ./files/authorized_keys
ansible-playbook prep_server.yml -i inventory --ask-pass --ask-become-pass -f 3 --extra-vars "{\"user\":\"${myuser}\"}"
