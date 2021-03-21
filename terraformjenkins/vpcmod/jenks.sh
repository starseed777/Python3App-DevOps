#!/bin/bash

yum install docker -y 

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum install jenkins java-1.8.0-openjdk-devel -y

systemctl daemon-reload

service docker start

systemctl start jenkins

usermod -aG docker jenkins 

yum install git -y 

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

yum install terraform -y 

yum install python3-pip -y 

pip3 install ansible -y 

service jenkins restart 