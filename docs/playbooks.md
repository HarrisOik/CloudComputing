# Ansible Playbooks
## Introduction

Ansible playbooks are YML files that are used by Ansible to execute commands (like apt update / apt upgrade) remotely. In these examples, we are using a file that Ansible call "inventory" which stores IPs and URLs of the remote systems you wish to execute the playbook on. More on this file later. Also, we are using bash scripts that automate the ansible commands for ease of use.

## Contents

We are using 3 playbooks (YML files) that aim at automating the remote deployment of the service. Those files are:
- prep_server.yml 
- start_service.yml
- stop_server.yml

##### prep_server.yml

As the name suggests, this playbook prepares the server(s) with the following content:
- Installs necessary programs for the VPN to function
- Installs necessary programs to be able to successfully install and create the service (theoritically)
- Creates SSH keys for passwordless connection between server and client (more on this in a second)
- Clones the repo of the services (https://git.swarmlab.io:3000/swarmlab/microservice-wordpress)

##### prep_server.sh

This script is responsible for the following functions:
1. To create SSH key pairs, store them and prepare them to be sent to the server(s)
2. To execute the ansible playbook command (ansible-playbook prep_server.yml -i inventory --ask-pass --ask-become-pass -f 3 --extra-vars "...")

> NOTE: 
>
> "-i inventory" specifies that we will be using the file named "inventory" as the ansible inventory
>
> "--ask-pass" specifies that we will be asked the password of the machine (as you do when you connect with SSH)
>
> "--ask-become-pass" specifies that we will be asked the sudo password of the machine (as you do when you try to execute commands using sudo)
>
> "--extra-vars" specifies that we will pass in external variables (in our case the user of the machine - make sure to change the user on the file) to the playbook

##### start_service.yml

As the name suggests, this playbook starts the service using the following:
- Uses make to build the service (more here: https://git.swarmlab.io:3000/swarmlab/microservice-wordpress/src/branch/master/README.md#run-instance)
- Uses make to start the service (more here: https://git.swarmlab.io:3000/swarmlab/microservice-wordpress/src/branch/master/README.md#run-instance)

##### start_service.sh

This script is responsible for the following function:
1. To execute the ansible playbook command (ansible-playbook prep_server.yml -i inventory --ask-pass --ask-become-pass -f 3 --extra-vars "...")

> NOTE: 
>
> "-i inventory" specifies that we will be using the file named "inventory" as the ansible inventory
>
> "--ask-pass" specifies that we will be asked the password of the machine (as you do when you connect with SSH)
>
> "--ask-become-pass" specifies that we will be asked the sudo password of the machine (as you do when you try to execute commands using sudo)
>
> "--extra-vars" specifies that we will pass in external variables (in our case the user of the machine - make sure to change the user on the file) to the playbook

##### stop_service.yml

As the name suggests, this playbook stops the service using the following:
- Uses make to stop the service (more here: https://git.swarmlab.io:3000/swarmlab/microservice-wordpress/src/branch/master/README.md#run-instance)
- Uses make to destroy the service (more here: https://git.swarmlab.io:3000/swarmlab/microservice-wordpress/src/branch/master/README.md#run-instance)

##### stop_service.sh

This script is responsible for the following function:
1. To execute the ansible playbook command (ansible-playbook prep_server.yml -i inventory --ask-pass --ask-become-pass -f 3 --extra-vars "...")

> NOTE: 
>
> "-i inventory" specifies that we will be using the file named "inventory" as the ansible inventory
>
> "--ask-pass" specifies that we will be asked the password of the machine (as you do when you connect with SSH)
>
> "--ask-become-pass" specifies that we will be asked the sudo password of the machine (as you do when you try to execute commands using sudo)
>
> "--extra-vars" specifies that we will pass in external variables (in our case the user of the machine - make sure to change the user on the file) to the playbook

