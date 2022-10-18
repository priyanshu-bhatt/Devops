## DOCKER NETWORKING PART 2

- Through the help of runtime we can run the container this RunTime or DOCKER is Runc
- Docker has the capability to create a network infrastructure as it have plugins for it.
- wWith the help of this capability Docker have a internal infrastructure which connects each container(future container) to be connected with switch and 
Switch connected to Router.
                         This Setup is called Bridge.
	And this is bydefault network infra and it is created becz of the plugins docker have for network.

## Bridge Network Infrastructure.

- A Device which works both as a router and as a Switch is called Layer 3 switches eg: broadband.
- Using SDN we can use Layer 3 switch and here it is called Bridge(SDN Layer 3 Switch).
- Due to this we are able to have internal container and internet connnectivity.

## Why to Create a Custom Network.
- DHCP provides custom IP's to devices and DNS provides hostnames and these combined are called
IPAM(IP Address Management).

- Bridge also have the facility of IPAM(By giving Ip and hostnames). 
- Network Range is fixed in the subnet eg: |172.17.0.0/16| means network range is |192.168| ie. 65536 IP's. 

### Reason:
- To give my own network range/Net-Mask/Name.

## Creating Own Lan/Lab/Network.

- with name of network lw.
- driver to be put is Bridge.
- IPAM setting to give subnet name and range as (10.1.2.0/24).
- docker0 is private NIC vard of the router.Due to this I am able to ping my host system and vice-versa.Hence if the base system cannot go to internet hence docker can also cannot go out.
II'ly If the base host.

When we inspect the bridge we can see nating is enabled ie. enable masquerade.
Behind the scene the launched contaner is using the docker0

PRIV-IP                   docker0   ROUTER               INTERNET
                         (PRIVATE)
And Default is set as bridge in the network bridge setting which can be seen doiing docker inspect network bridge

- docker run -dit --name test2 

- when we create new network a new network card is created can be seen using ifconfig.
inter connection between different network is not allowedthey have internal not the cross connectivity.
Even using the name also they are able to ping this is bcz of the custom network that we created and this is the facility of the custom network.
though The IP get changed but name remains same hence whatsever IP it have after afain launch it still becomes reachable as we are connecting using
the name.

- Problem solved of the MYSQL server getting down
- Hence using custom network we can get rid of the problem of downtime,and no need of using the link way to connect wordpress and mysql.
- hence we don't need to remember the Ip just the name we can do stuffs.

## Commands
- docker run -dit --name myp1 -p 8080:80 --network <NETWORK-NAME> wordpress:latest
- docker run -dit --name mydb1 --network <network-name> -e MYSQL_ROOT_PASSWORD=<> -e MYSQL_DATABASE=<> -e MYSQL_USER=<> -e MYSQL_PASSWORD=<>  -v /mymymysql-data:/var/lib/mysql mysql:latest

## Setting Up the wordpress
- Use your instance IP:8080
- dbname mydb1 name that You created in command
- username <>
- password <>
- dbhost mydb(container name of database)

now if database container delete
and when we again launch it with the same name then it gets connected to the wordpress by itself though its IP get changed or whatsoever.
