resource "aws_subnet" "main" {
  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "terraform-public-subnet"
  }
}