# Container Namespaces

- Contaniner is process.
- As each laptop is isolate from each other, which provide better management of resources and security.
- Simillary Process is also ans OS hince it provide resources(Hardware) and processes.

## Isolation in the container is given by namespaces.

                               || OS ||   

|(Resources)|     |multiple process|   |Netwrking      |Hostname|  |USER/LOG|
CPU/RAM/HD                                 IP|

- For a process to work like a container a personal space i.e. a namespace they should be in having sep netwrk(network namespace),hosname(Host namespace),process tree(process namespace), etc.
that is everything in container and host is isolated even the use is different

- lsns : Shows the list of namespaces.
- nsenter: To Enter a namespace.

- nsenter -t <pid> -n

-unshare command to create your known namespaces.
 If in one Os we launch multiple processes by defalut process share the host  inderlying resources.Every container will see same hardware resource but its  in sharing from host.

- Namespaces doesn't work for Resource(Hardware resources),Hence if the container is launched all the hardware resources are used as it is directly from the host.

- In base if we have 4 GB RAM then every process/container running share the same ram,But if want to provide a dedicated Resource to the Process i.e.  Limiting the resources for process or container,This can be done using the cgroup( With the help we can restrict the container under certian resources).

- Using simple commands we can do these eg:cpu_period,memory
 docker run -it --name os5 --memory 8000000 centos
(minimum limit is 6MB)doc

- docker run command means start a process bash and give them a personal namespace ,-it means take me to the namespace(kind of nsenter command),The Drive come from the image ,Entire hardware resource come from the host in sharable way which we can restrict using cgroup concepts.
These all makes us feel its an OS.

- bts This Container is run by the container runtime program which is called a runc.Container bts is launched by runc only Docker is just an management command/Tool for images,storage etc.