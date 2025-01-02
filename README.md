# AmatipIT-DevOps-task


 AmatipIT-task-documentation

donwloaded and configured aws cli

created project structure for Terraform, breaking the configuration files into custom modules(ec2_module and subnet_module)

used aws provider to create resources in aws

configured a remote backend for terraform state file which is like the brain of terraform using aws s3 bucket as the remote storage

ran terraform init to initialize the backend, initialize the custom modules, download terraform and the aws provider plugins

ran terraform fmt and validate to ensure the configuration is valid and well formated

ran terraform plan to preview the changes

ran terraform apply to apply the changes

the commands to install docker and run nginx container was passed as user_data through a file script.sh

after the infrastructure has been provisioned I logged to the server via ssh using my private key to authenticate with the public key I provided while configuring the server

Disabling root login for security

while logged in I edited the /etc/ssh/sshd_config file searching for a line that read "PermitRootLogin" changed it to no

setting up firewall used ufw(uninterrupted firewall) a utility tool used for configuring firewalls

ran sudo ufw enable to enable it

ran sudo ufw allow ssh(port 22) and http(port 80) ssh for secureshell that allows for connecting remotely to the server and port 80 a port which nginx uses by default

steps for installing docker #!/bin/bash
Update package list

sudo apt update
install docker

sudo apt install -y docker.io
start the docker daemon

sudo systemctl start docker
enable docker to run on system startup

sudo systemctl enable docker
grant the default user (ubuntu) aws provides for ubuntu server, access to run docker commands if needed by adding him to the docker group

sudo usermod -aG docker ubuntu
pull an nginx image from docker registry (docker hub) to run a docker container from because the image won't be available locally by default

sudo docker pull nginx
run an nginx container from the pulled nginx image and assigning the container port 80 and mapping it to the host port 80 running the container in detached mode

sudo docker run -d --name nginx-container -p 80:80 nginx
About
No description, website, or topics provided.
Resources
Readme
Activity
Stars
0 stars
Watchers
1 watching
Forks
0 forks
Releases
No releases published
Create a new release
Packages
No packages published
Publish your first package
Footer
