# Docker Swarm.
### Problems We usualy face:
- Container when launched becomes the single point of failure.
- it aslo takes hardware resources from the host which mostly is not   enough.
- Down time if anything wrong happens.Scalling of the resources is also not possible ie. vertical scalling, as it can cost a lot to a company.

## Where Docker Swarm comes into play.

- By applying Horizontal Scalling Techniques.

		          Master Node(Manegement is done by master) 
                             13.233.150.252  

     A                            
(Worker Node)  		Worker Node 2           Worker Node 3          Worker 4   13.233.150.252        
Containers are launched in these node   

- This Cluster Setup can be done using Docker swarm.
- There is no need of 3rd party tool like kubernetes or else,Docker swarn is docker tool.             

## DOCKER SWARM
- Main Ip of the Manger has to be advertized

- docker swarn init --advertise-addr 172.31.2.3(Manager Node) -> In Manager Node.

orkers will join the swarn cluster by a the use of join-token A special command have to be run in each the worker.
- Launch the container we use the service command.
- docker service create --name webserver httpd
- docker service ls( To list the service)

- The wroker node is randomly decided by the manager and its an random process
- docker service ps myserver1(Container name) : This to check the details of the container launched and the which node it is launched in.
- If a container even get deleted or gets down then it will automatically launch t again in sae


