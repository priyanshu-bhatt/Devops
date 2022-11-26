- Container can be launched using
docker run
dokcer compose
docker swarm

All the container running inside a single docker host have internal connectivity with bridge network.

  There is no cross connectivity between two diff host
10.10.10.2           10.10.10.5
container            
here are
interconnnected


## Why we want cross connectivity
becz in cluster everybody in the cluster work together as its a multi tier archi we need to connect multiple containers in different host or nodes together to work efficiently.

By default Bridge network doesn't provide this feature ,But we were able to ping a different container html page from different node Ip:8080 this is beacuase docker swarm makes the use of the overlay networks.

## Overlay Networks

Overlay networks are distributed network that allow containerd in two different nodes to be interconnected.
As soon as we create a docker swarm service  cluster a overlay network is created which connects each nodes in and when we do docker insect network overlay all the interconnnected nodes are shown in the peers section.

## Creating an Overlay network.
docker network create --driver overlay myoverlay

## using custom overlay in the service
docker service create --name myweb --publish 8080:80 --network myoverlay httpd

and where the task wil be launched in any of the worker or manager node then tehre also the overlay network will be created.

## How to Encrypt Overlay Network.

Overlay distributed network is not safe hence it will use the physical network hence how to encrypt it using swarm 

- So while creating network
docker network create --opt encrypted --driver overlay mysecurenet

now using this way the network is secure now.

Now we can ping from node 1 conainer to node 2 uisng overlay networks.This overlay network uses an networking concept VXLAN that is extended LAN.


Docker compose can work only on the singe node but if the requirement is multi node then we have to use dockerswarm but to automate we integrate docker compose file with docker swarm.

In swarm service have one limitaton task created using service this will just have just one container in task. So we can use use Docker Compose + Docker Swarm using the functionality of stack hence we can integrate both together.

stack is the capability in docker this can help to create multiple container in cluster using the compose file.No need to create the service,network maually just using the compose file and swarm cluster.