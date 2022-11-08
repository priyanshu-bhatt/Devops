## ENTRYPOINT AND CMD

- Use Copy command to copy python file and run using  the CMD command in the 
 run time.
- Every Container is used for just a single work hence CMD alone will just run the file hardcoded.
If it is used with Entrypoint then the default become the argument given to entrypoint and
the input to CMD is taken from the terminal using runtime.

### Adding flexibility for user to run whatever file to be run on the runtime.
FROM centos:7

RUN yum install python3 -y
COPY  hello.py .
COPY text.py .
COPY my.py .

ENTRYPOINT ["python3"]
CMD["my.py"]
// Anybdy using this command can at the running time of the command give the filname if no filename is provided than
the filename given in the argument will prevail and run.

## DOCKERHUB
A centralized  public repo used to store docker images,These are called public docker registry,Imgaes are uplaoded and maintained
by the specific company as well as the users custom images.

- Create DockerHub Account.
- Edit/Tag the image to be pushed with the username/imagename:version while building the image.
- then do docker push imagename.(docker push <IMAGE_NAME>
- Now anyone in the world can use/pull this image.(docker pull <IMAGE_NAME>)
