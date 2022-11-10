# DOCKER CORE OF WHY DOCKER IS FASTER CONCEPTS:

-Every process have a unique process Id and its given by the kernel.
- Internally these numbers are just like a folders.At the memory level it is equals to folder or directory.
- When we kill the process this folder is removed from the memeory and that folder  contains the files related to the process.
- Every folder is linked to the / folder
- Every process have the root folder and this root folder is linked with the /(main) folder which maked it use anything in the OS.
-In OS we can run multiple process and if one single OS we can run multiple process that single process which have nested process is looks like an OS(As OS have mutiple process running).
## Why container is soo fast in sec because docker is not launching an OS,Its behind the scene launching the process.

- When we do docker run then behind the scene for the base operating system its just an process, which launches an bash command BTS and of we kill this bash process then we also stop the container.
- When Docker is launched it open the bash shell because its the first command it executes,and when we do exit it exit the process or internally looks like OS/container getting stopped this docker process is considered an OS.
- with the entrypoint and cmd its decided which command to be executed and that process is the whole container itself.
- its because the newer kernel supports the process inside the process concept.(means the entire OS is running inside a process)
- When we do docker attach that means we are inside an process and we get the bash bcz the process gives bash shell.Container indiretly means the container with processes.
- All the conatiner are process and process have the linked the the  root to / folder but its not the main / folder.But inside each process/container we have different different file system how ? so its a trick that when the conainer is not attache to the root drive but its the 
image that is attached.	The drive comes from the image

-  anything done inside the /root folder inside the process of the container, the same changes can be seen inside the container.Image is more like an drive to the container , That file system is comming from the image.

## But still How conatiner handling all the other networking stuffs etc etc.
Here the concept of namespace and cgroups comes into play.