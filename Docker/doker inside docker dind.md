# DOCKER INSIDE DOCKER (DIND)

- DIND is used when we need a docker container inside a   container over a single host.
- Bts docker start a program service they start one socket,bcz of which docker have availability to communicate with other program.

- If ths socket is not present nothing can be done by docker.

- As base system have this socket or driver container.d.sock,hence due to this we are able to run docker.Hence docker can do docker stuffs.

- If we launch an container with centos image then the socket file is required to run the docker inside the container.

How to start services in the container using systemctl file.

- In base run systemctl status docker :
  this hows the /usr/bin/dockerd..... which means by   running   this command/file we can run the docker.

- but when we tried to run dockerd command it failed.
- In base its available and working but not in the container,So we will try to share the socket to the container.


# Security in Docker:
for some commands root is required tho already being a root,Like cannot change hostname,date tho being a root,One of those thing is create a socker ,tho already being a root.

Container have a very limited power,tho being a root still there is restriction as root of host is even not having the power to do some stuffs.

Thats why dockerd command was not working being a root also bcz docker container doesn't have the capabilities.
This is called docker capabilities which can are mentioned in the website of docker

We can even add the capabiltites or drop to give all the capabilities of host root to the container using the --privelege tag(highest capa).

There are list of capabilities thta we can provide or drop,its always good to provide limited power but to provide full use prviledge.

docker run -it --cap-drop-NET_RAW --cap-drop=CHOWN --cap-add=SYS_TIME centos:7

some if even drop can still work becz a capability depends upon a lot of internal capabilities.Using this command we can do a lot of customization for power of root inside the container.

# --priveldege
docker run -it --name priyanshu --priviledge centos:7

now all the base container stuffs can be accessed using this container which can be a security threat.

now we can download docker and start the server using dockerd command but this time error is different then the previous as it shows the socket is getting created but there is some different error.

docker pull docker:dind
This image contains the reinstalled docker,servives,sockets,etc. but should be used with priveldges tag.

docker run dit --privileged --name mydinal docker:dind

This container works as a real os and in the top of it we can launch multiple container over it.

Now all the docker client can be run inside the docker container

Its an independent os nothing is affecting the host.


