## SETUP NFS SERVER IN VIRTUAL BOX

## IN NFS SERVER HOST

```
yum install nfs-utils
systemctl start nfs-server
mkdir /folder
```
```
vi /etc/exports
/folder  192.168.102.3(rw,no_root_squash)

systemctl restart nfs-server
systemctl disable firewalld
```

```
exportfs -v
```

## INCLIENT HOST

```
yum install nfs-utils
mkdir /data

systemctl disable firewalld

mount 192.168.102.2:/folder /data/
```
