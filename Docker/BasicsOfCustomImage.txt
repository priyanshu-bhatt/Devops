## How To Create  Custom images using commit command and DockerFile
- If teh setup is to be used multiple times, this can be performed using a custom created image
and sharing it with the other team members.

- Can be done using commit command or DockerFile.

## Launch a container with all the other features you want to add in the container
docker run -dit --name cont1 centos

## create a image using commit command
docker commit cont1 myimage:v1

# Using Dockerfile
Using certain keywords we can run cetain stuffs in the 
- vim Dockerfile
- write the stuffs in the Dokerfile
- FROM cento
- RUN mkdir /folder
- RUN touch /folder/filename

docker build -t imagename:v1 -f Dockerfilename .
- This will build the image an from this image we can create a new container
- By default fileName is Dockerfile but if we want to give a custom name then we can 
  reference it using -f <FILE_NAME>
eg:
 - FROM centos
 RUN yum install httpd -y

Every command will run on the the top of default folder only i.e. / and every time we run the RUN 
conmmand it will reset the path and run only in the default folder, so we have to use another keyword 
called WORKDIR which is image specific(Every image have a default folder)
eg:
WORKDIR /var/www/html
now any file created will be created here as we made it a default dir.

or else we can give full path as /var/www/html/index.html

- Copying Files from host to the container
touch hii
docker cp filename<location_file_copying_from> containername:location_to_be_copied<eg /tmp>
			OR
COPY /root/main.txt home.html

- But as the services fo httpd was not started hence we'll be unable to connect with the page.
BUILD_TIME: RUN
RUNTIME: cmd and entrypoint

- As life of container os the life of the program( but the life of services program are infinite untill we stop)
But when OS stops services also get stop.

