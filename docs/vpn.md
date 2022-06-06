# VPN
## Introduction

For the VPN to work, you will need to create a pair of SSH keys (refer to playbooks.md), as the configuration files require both public and private keys for all peers on the VPN (you will be guided through the process of configuring the files). Also, the VPN is using Wireguard.

## SSH Key Pairs

In both wg_client and wg_server folders, you will find 2 files named publickey and privatekey respectively. In those files, add the keys that you generate (the public key in the file named publickey and the private key in the file named privatekey). You will need to repeat the process(of generating a new key pair; on the wg_client files) for each peer you wish to add to the VPN.

## WG_CLIENT

### run-client.sh Configuration

In the file you will need to do the following changes:
- On line 7 & 8, replace the IP with the IP you wish your client to have when they connect to the VPN
- On line 9, replace {your_path_here} with the path that leads to the client folder
- On line 26, make sure to replace the timezone with your timezone

### wg_client ifup_linux Configuration

In the file you will need to do the following changes:
- On line 3, replace {client_private_key} with the client private key (the one that will exist in the file privatekey found in the wg_client folder) you generated
- On line 8, replace {server_public_key} with the server public key (the one that will exist in the file publickey found in the wg_server folder) you generated
- On line 11, replace {server_ip_address} with the IP of the server (the machine that will run the files found in the wg_server folder)
- On line 23 & 24, replace the IP with the IP you entered in the run-client.sh file

## WG_Server

### run.yml Configuration

In the file you will need to do the following changes:
- On line 44, replace {your_full_path_here} with the full path that leads to the server folder

### wg_server ifup_linux Configuration

In the file you can do the following changes:
- On line 6, replace the IP with the IP you wish the server to use (in the VPN)

### wg_server .USER file example

The .USER file is used to automatically add peers to the VPN without the need to use "wg set ..." command every time you wish to add a new peer. In the file you have to change:
- client_public_key to the clients public key
- the IP to one you wish the client to use (same as the one you added on the wg_client files)


## Running the VPN

To run the VPN you will need to do the following:
1. After you configure the files on the server side, run the file run.yml.sh. This should start the server side of the VPN
2. After you configure the files on the client side, run the file run-client.sh. This should start the client side of the VPN
3. On the client side, enter the docker container that is running the VPN using "docker exec -it wgclient /bin/bash"
4. While inside the docker container (on the client side), run the following commands
    1. "cd /settingsclient"
    2. "sh ./ifup_linux"
5. Check the connection by typing "wg" inside the container
6. Now you should be able to exit the container and ping the peers connected to the VPN (example: ping 10.1.2.66 should function normally (10.1.2.66 is the default server IP))
