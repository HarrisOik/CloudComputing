



WGNAME=wgclient
NETWORK_INT=wg2
NETWORK_IP=10.1.2.68
NETWORK_NETWORK=10.1.2.68/26
WGCONFIG={your_full_path}/client
#                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#                 add your client full path

docker stop $WGNAME
docker container rm $WGNAME

docker network rm $NETWORK_INT
docker network create $NETWORK_INT

docker run -d    --net=host   \
        --name=$WGNAME   \
        --cap-add=NET_ADMIN   \
        --cap-add=SYS_MODULE  \
         -e NETWORK_INT=$NETWORK_INT   \
         -e NETWORK_IP=$NETWORK_IP   \
         -e NETWORK_NETWORK=$NETWORK_NETWORK   \
        -e TZ=Europe/Athens   \
        -v $WGCONFIG:/settingsclient   \
        -v /lib/modules:/lib/modules   \
        hub.swarmlab.io:5480/venus-alpinewg:latest

# connect container
#docker exec -it wgclient /bin/bash

# RUN  in container
#cd /settingsclient/
# sh ./ifup_linux  

