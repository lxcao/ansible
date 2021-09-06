#Install ansible in local machine
#   install pyenv and virtualenvs
#   create ansible environment in pyenv and activate
#   pip install ansible
#   pip install oci

#Provision first instance
#   ssh-keygen -t rsa
#   Saved id_rsa and id_rsa.pub in the ~/.ssh folder
#   create one free instance in OCI, and get public IP address 129.159.203.255
#   copy ~/.ssh/id_rsa.pub content into the instance
#   try ssh opc@129.159.203.255 to test the ssh connection

#Provision second instance
#   create on free instance in OCI, and get public IP address 130.61.243.173
#   generate key pairs in OCI, download private and public(option) key in the local machine working space
#       ssh-key-2021-09-02.key
#       ssh-key-2021-09-02.key.pub
#   try ssh -i ssh-key-2021-09-02.key opc@130.61.243.173 to test the ssh connection

# create anslbie.cfg and hosts file in the working directory
#   not accept - and : in group name, use _ instead of 

# no need to referce private key to oci_host1, because it saved in default ~/.ssh
ansible -i hosts oci_host1 -m ping -u opc

# if not referece to private key file in hosts, test by using
ansible -i hosts oci_host2 --private-key ssh-key-2021-09-02.key -m ping -u opc
# reference to private key file in hosts, test by using
ansible -i hosts oci_host2 -m ping -u opc

#test all
ansible -i hosts all -m ping -u opc

#put the user in the hosts
ansible -i hosts all -m ping
