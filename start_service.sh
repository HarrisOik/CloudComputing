#!/bin/bash
myuser=user
ansible-playbook start_service.yml -i inventory --ask-pass --ask-become-pass -f 3 --extra-vars "{\"user\":\"${myuser}\"}"