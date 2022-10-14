## From Docker we can ping outside but from the outside we can't ping.

- If myql goes down and the new mysql container IP is also different then using the concepts of networking it get connected to the Wordpress and we don't loose any content.

- The Ip that our windows shows  using ipconfig is private ip but private can't connect public.
But Our private IP can connect to internet this is possible using NATING.

PC:               | (GATEWAY)|                                       ______               __________
Private           |  Router  |                                       | ISP |              | 8.8.8.8|
Ip  		  |Broadband |
	=>   ___________     _________
	    | private IP |  |public Ip|
	                    Through this
           our IP          we go to the internet
       Connects to this 
         Router's IP

                                                              This is Done by ISP 
      ______________________                                      ________
eg:   |source: 192.168.10.1|     =>=>=>=>=>=>=>=>=>=>=>=>=>=>=>=> |1.2.3.4|
      |Destination:8.8.8.8 |                                      |8.8.8.8|
   This is not allowed by default as the source is               source is chnaged to 
private and destination is public hence not allowed             Router Public Ip address
 so ISP will drop it!!

- Hence Actual Private IP of the computer is hidden by the Router Public IP  this concept is called NATING(Network Address Translation)


- IF all the Computers are in a LAB are connected in a LAN hence they have the same network name or same IP class
eg: 192.168.10.1,192.168.10.2,192.168.10.3,192.168.10.4  -----------

- To connect all these we use the Switch device to connect all together in same network.
With software programs we can connect the way a real togology is connected  but virtually using SDN.


- Docker has created an entire network using the SDN.A Switch(here Bridge) connects every single container in a single LAN(Network).As soon as an container is launched within this netwrok every other container
connected to the newly launched.Hence docker also helps in setting up of the entire network infrastructure.Hence being a management tool also it provides all the features related to docker container managemenet
such as storage,networking etc.

- Docker had set an particular IP range in a particular network/lab/Lan its precreated or we can create own.

### To list total number of network
docker network ls

- Driver name is the device which is used eg: bridge,host,null

### To know more about the network/LAB
docker inspect network <Network Name>

- Each Container have hardware IP range and private also hence they connect to each other.
Automatic process of assigning IP's is using DHCP dynamically in a certain range.Here in inspect the range is shown in the "Subnet" key.

- By deafault a new container is launched in the bridge netwrok.

- Docker also have a Router inside which is connected to the bridge and have the facility of NAT and PAT hence we can Go to internet from the container.
