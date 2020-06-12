#!/bin/bash
cd /root/slave1/
sudo yum install curl 

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

sudo chmod +x /kubectl

sudo mv kubectl /usr/bin/