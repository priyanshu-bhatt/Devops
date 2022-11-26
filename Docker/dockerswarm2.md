- Container Cluster here is created using Docker bative tool called Swarm.
having manager-slave(master-slave archi).

- Admin the user request for the launch of the container.

- In some situations we need multiple containers called multi container setup.

- For swarm looks at just the box the cluster.And whatever we do is a task for swarm.Everything will be encalpsulated under the task this task is a vocabulary this   outside box is called box(task).For swarm task is waht it can manage or maintain,and its then our choice if we want to have single container task or multi container    task.

- As a user we'll contact the swarm with our image and swarm will launh the container inside the task.Master duty is to watch this task and if any fault happen then it   launch this to another node.

- Or we can have multiple replication of same task and then do balancing of load users using the horizontal scalling i.e. creating replicas.

 internet ----
             -> Load Balancer ---
                      |
node1    nod2       node3          node 4    node 5

- This load balancing setup is already setuped precreated.This program in the swarm is called service.


- using docker swarm container uisng an image is launched inside the task,swarm will always launch a service be it we have just one task or mulitiple task.

- behind the scene all the task created will be linked to public via service.

- Container can be launched in the leader or in worker node but the decision is taken on by the manager node.

- service has to be created by us.
- When a service is created a task is created and when more replicas in the task is created then the name is given by the servicename.1,servicename.2....


- when the oublic site is hit this website is inside a container inside a task.Between the client and  task there is a program load balamcer(service) connects client   with the task.As the service is exposed to a port 8080 hence we connect with publicIp:8080.

- If we delete the container manually ,but still we are ablel to connect to the website,as as soon as something happen to website the service will launch the task in   some other and we will be able to connect again.

- swarm is majorly a container orchaestration tool.
## To create a task
- docker service create --name priyanshu httpd
##to publish task at port 8080
- docker service create --publish 8080:80 --name priyanshu httpd
##Scalling up the task.
- docker service scale myweb=4