resource "aws_internet_gateway" "main" {
  vpc_id = module.vpc.vpc_id
  tags = {
    Name = "terraform-project-igw"
  }
}