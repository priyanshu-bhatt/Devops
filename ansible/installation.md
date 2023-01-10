# Installing Ansible in AWS.

### Step 1 : Launch Ansiblel Master -> yum install ansible ( run the follow up command)
### STEP 2: Launch  Ansible Slave 

### Step 3: change the sg rules for Master and Slave -> ssh(22) + all traffic(not security oriented)

### Step 4: Copy Public Ip of slave then in Master:
    - vi /etc/ansible/hosts 
  #### edit and put the public Ip of slave in the hosts file.
  
### Step 5: In Master try:
    - ansible all -m package -a "name=httpd state=installed"
  
  #### This will show error related to the ssh 
  
### Step 6: In Master run ssh-keygen and generate public and private keys, Copy public keys of master.

### Step 7: Paste the public key in the authorized key in the slave.

### Step 7: Check the Connection by:
    - ansible all -m ping
  ####  this will show that the slave nodes are healthy
 
### Step 8: test by provisioning httpd.
    - ansible all -m package -a "name=httpd state=installed"
    
 
