#!/bin/bash
yum update -y
yum install -y httpd git unzip wget

# Install Terraform CLI to manage child EC2s
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_amd64.zip
unzip terraform_1.6.5_linux_amd64.zip
mv terraform /usr/local/bin/
