# Terraform AWS Infrastructure Project

## Project Overview

This project demonstrates how to provision and manage AWS infrastructure using Terraform as Infrastructure as Code (IaC).

The infrastructure includes an AWS VPC, public subnet, Internet Gateway, route table, security group, and an Amazon Linux EC2 instance.

Terraform variables, outputs, state management, and an AWS AMI data source are used to make the infrastructure reusable and maintainable.

## Architecture

```text
                         Terraform
                             |
                             v
                    +------------------+
                    |      AWS VPC     |
                    |    10.0.0.0/16   |
                    +--------+---------+
                             |
                             v
                    +------------------+
                    |  Public Subnet   |
                    |   10.0.1.0/24    |
                    +--------+---------+
                             |
              +--------------+--------------+
              |                             |
              v                             v
     +------------------+          +------------------+
     |  Route Table     |          | Security Group  |
     |  0.0.0.0/0       |          | SSH : 22        |
     +--------+---------+          | HTTP: 80        |
              |                    +------------------+
              v                             |
     +------------------+                    |
     | Internet Gateway |                    |
     +------------------+                    |
                                            v
                                  +------------------+
                                  | EC2 Instance     |
                                  | Amazon Linux 2023|
                                  | t3.micro         |
                                  +------------------+

## Technologies Used

- Terraform
- AWS
  - VPC
  - Subnet
  - Internet Gateway
  - Route Table
  - Security Group
  - EC2
- Amazon Linux 2023
- Git & GitHub
- Terraform AWS Provider

## Infrastructure Created

| Resource | Purpose |
|---|---|
| VPC | Provides an isolated AWS network |
| Public Subnet | Hosts the EC2 instance |
| Internet Gateway | Provides internet connectivity |
| Route Table | Routes internet-bound traffic through the Internet Gateway |
| Route Table Association | Associates the route table with the subnet |
| Security Group | Controls inbound and outbound traffic |
| EC2 Instance | Runs the application/server workload |

### Security Group Rules

- SSH — Port 22
- HTTP — Port 80
- Outbound traffic — All protocols

## Terraform Project Structure

```text
terraform-aws-project/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── data.tf
├── vpc.tf
├── subnet.tf
├── internet_gateway.tf
├── route_table.tf
├── security_group.tf
├── ec2.tf
├── .gitignore
├── .terraform.lock.hcl
└── README.md

> **Note:** `terraform.tfvars` is excluded from version control using `.gitignore` because it contains environment-specific configuration values.

## How It Works

Terraform uses the AWS provider to communicate with AWS and provision the required infrastructure.

1. The VPC is created with the `10.0.0.0/16` CIDR block.
2. A public subnet is created inside the VPC.
3. An Internet Gateway is attached to the VPC.
4. A route table is configured with a default route (`0.0.0.0/0`) through the Internet Gateway.
5. The route table is associated with the public subnet.
6. A security group allows SSH and HTTP traffic and permits outbound traffic.
7. An Amazon Linux 2023 AMI is dynamically discovered using a Terraform data source.
8. An EC2 `t3.micro` instance is provisioned in the public subnet.


9. Terraform outputs expose the VPC ID, subnet ID, EC2 instance ID, and public IP.
