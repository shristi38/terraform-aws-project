# Terraform AWS Infrastructure with Jenkins CI/CD

## Overview

This project demonstrates how to provision and manage AWS infrastructure using **Terraform** and automate the Terraform workflow using **Jenkins CI/CD**.

The project follows Infrastructure as Code (IaC) principles, where AWS infrastructure is defined, version-controlled, validated, planned, and deployed through automation.

## Features

- Terraform fundamentals
- AWS provider configuration
- Terraform variables and outputs
- Terraform modules
- AWS VPC networking
- EC2 provisioning
- Dynamic AMI selection
- Terraform remote state using Amazon S3
- AWS IAM authentication
- GitHub integration
- Jenkins CI/CD
- Terraform validation, plan, apply, and destroy

---

## Project Architecture

```text
Developer -> GitHub -> Jenkins -> Terraform Pipeline -> AWS Infrastructure
```

## Technology Stack

- Terraform
- AWS (VPC, EC2, S3, IAM)
- Jenkins
- GitHub
- Git
- AWS CLI
- Linux

## Terraform Project Structure

```text
terraform-aws-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── data.tf
├── subnet.tf
├── internet_gateway.tf
├── route_table.tf
├── security_group.tf
├── terraform.tfvars
└── modules/
    ├── vpc/
    └── ec2/
```

## AWS Provider

```hcl
provider "aws" {
  region = var.aws_region
}
```

Region: `us-east-2`

## Variables Example

```hcl
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-2"
}
```

## Terraform Modules

### VPC Module

```hcl
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}
```

### EC2 Module

```hcl
module "ec2" {
  source = "./modules/ec2"
}
```

## Dynamic Amazon Linux AMI

Uses a Terraform data source to fetch the latest Amazon Linux 2023 AMI dynamically.

## Networking

- VPC: 10.0.0.0/16
- Subnet: 10.0.1.0/24
- AZ: us-east-2a
- Internet Gateway
- Route Table
- Security Group

## Terraform Outputs

```hcl
output "public_ip" {
  value = module.ec2.public_ip
}
```

## Remote State

```hcl
terraform {
  backend "s3" {
    bucket = "shrishti-terraform-state-2026"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
```

## Terraform Workflow

```text
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

## Jenkins CI/CD Pipeline

Stages:
1. Checkout
2. Terraform Init
3. Terraform Format Check
4. Terraform Validate
5. Terraform Plan
6. Manual Approval
7. Terraform Apply
8. Terraform Output

### Pipeline Example

```groovy
pipeline {
  agent any
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Terraform Init') { steps { sh 'terraform init' } }
    stage('Terraform Validate') { steps { sh 'terraform validate' } }
    stage('Terraform Plan') { steps { sh 'terraform plan' } }
    stage('Approval') { steps { input message: 'Approve Terraform deployment?' } }
    stage('Terraform Apply') { steps { sh 'terraform apply -auto-approve' } }
  }
}
```

## Security Considerations

- IAM Role based authentication
- No hardcoded credentials
- S3 Block Public Access
- Remote Terraform state
- Manual approval before deployment

## Future Improvements

- DynamoDB state locking
- Terraform workspaces
- Multi-environment deployments
- Security scanning
- Slack/Email notifications
- Automated testing

## Repository

GitHub Repository:

https://github.com/shristi38/terraform-aws-project

## Interview Summary

I worked on an Infrastructure-as-Code project using Terraform and AWS, building a VPC, subnet, internet gateway, route table, security group, and EC2 instance. I modularised the infrastructure, implemented remote state in S3, and integrated GitHub with Jenkins for automated Terraform validation, planning, approval, and deployment workflows.
