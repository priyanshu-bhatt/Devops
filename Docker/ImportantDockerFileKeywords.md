## DOCKER FILE INTEGRATION WITH DOCKER COMPOSE
- Launching a container with Tomcat image version 9.
- docker pull tomcat:9.0
- docker run -dit tomcat:9.0
- attach command can give us bash only if the image have the bash available at launch
 Hence we'll be unable to go in the tomcat as tomcat runs th server of attached instead of giving
 bash.
- use docker exec -it <Cont_ID> bash
 This gives the bash in the container hence we can go in the tomcat or other images
which don't have bash attached.
## Building Docker File to Launch tomcat server using Dockerfile
FROM tomcat:9.0

RUN mkdir /usr/local/tomcat/webapps/ROOT
COPY index.html /usr/local/tomcat/webapps/ROOT/

## BULDING IMAGE USING DCOKER-COMPOSE
- using a keyword build we can build images by giving the path in it
in this we don't even need to give the image name as it will automatically get
build through dockerfile.
docker-compose build -> To alone build the image but not launch
docker-compose up ->Build images as well as launch the declared container in docker-compose file.

This will help us do everything with just the docker-compose command.Anything changed in the main index file
and after del the previous image then we do docker-compose up then it will first buld new image and then launch
the container.

We can give the port , so that to curl we just hit the host os IP and it will port
port:
 "8081:8080"

when we hit curl HOST_IP:8081

#ADVANCE DOCKERFILE i 
ADD will download some code from the online and copy in the container using URL also.
eg:ADD https://github.com/priyanshu-bhatt/HacktoberFest2022-DevopsCheatSheet/blob/main/Docker/Blogs.md /

But in COPY we cannot do using COPY command.

##CREATING ARCHIVE FILE
tar -c -f myweb.tar website/

ADD myweb.tar /
(This will copy all the files as well as copy;But comparitively slower than copy)
COPU myweb.tar /
(COPY will just copy from source to container but won't extract)

EXPOSE 
used to do patting in the Dockerfile itself 
and while running docker run -dit -P(This will go in the history and check for exposed port) <Imag_name>

ENV keyword:
as soon as container launch the  env variable gets set up.

- COMPLETE DOCKERFILE
FROM centos:7
RUN yum install httpd -y
COPY *.html /var/www/html/
EXPOSE 80
ENV name="priyanshu"
ENTRYPOINT ["httpd"]
CMD ["-DFOREGROUND"]


