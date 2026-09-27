terraform {
  backend "s3" {
    bucket = "shrishti-terraform-state-2026"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr

}

module "ec2" {
  source = "./modules/ec2"

  ami_id                      = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main.id
  security_group_id           = aws_security_group.main.id
  associate_public_ip_address = true
}

