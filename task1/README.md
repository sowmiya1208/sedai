Objective
================================================================
This document outlines the process of setting up an AWS infrastructure using Terraform, incorporating EC2 instances behind an Application Load Balancer (ALB) using a pre-configured Golden AMI to minimize boot time.

Implementation Steps
==================================================================
1. EC2 Instance Creation and Ansible Setup
-------------------------------------------------------------------
Launched an EC2 instance.
Installed Ansible on the instance.
Created an Ansible Playbook and an HTML template to configure the Nginx server.
The Ansible script retrieved the instance’s IP address and displayed it in the browser when accessed.

2. Creation of a Golden AMI
-------------------------------------------------------------------
After configuring the EC2 instance, an Amazon Machine Image (AMI) was created from it.
This Golden AMI was used to avoid repetitive Ansible execution and reduce instance boot time.

3. Terraform Deployment
----------------------------------------------------------------------
Terraform was used to launch multiple EC2 instances using the Golden AMI.
A Virtual Private Cloud (VPC) was set up with two public subnets.
An Application Load Balancer (ALB) and a Target Group (TG) were created.
EC2 instances were associated with the ALB and attached to the Target Group for load balancing.

4. Ansible playbook
-------------------------------------------------------------------------
Ansible playbook will run as part of userdata
   
command: ansible-playbook -i localhost, -c local /home/ec2-user/install_nginx.yml
   
Outcome
======================================================================
The setup ensures that new EC2 instances are provisioned quickly using the pre-configured Golden AMI.
The ALB distributes traffic among instances, ensuring high availability.
The Nginx web server responds with a message displaying the instance’s IP address when accessed via a browser.
