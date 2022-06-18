# Service
## Introduction

The service that we used is "https://git.swarmlab.io:3000/swarmlab/microservice-wordpress/src/branch/master". It is WordPress that utilizes microservices architecture to run (using containers). Unfortunately, I was unable to make this service work.

## How to Run

Considering the README file provided (https://git.swarmlab.io:3000/swarmlab/microservice-wordpress/src/branch/master/README.md), I created ansible playbooks to automate the process of setting up, starting and stopping the service remotely.
1. Setup the server as mentioned using prep_server.sh (please read relevant documentation before using). This will (excluding other functionality) clone the repo of the service forementioned and save it at the home directory of the user (/home/{user}/microservice-wordpress)
2. You can start the service by using start_service.sh. This builds and starts the service using the make file provided.
3. You can stop the service by using stop_service.sh. This stops and destroys the service using the make file provided.
