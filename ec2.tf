resource "aws_instance" "web" {
  ami                         = var.ami_id # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  tags = {
    Name = "terraform-project-ec2"
  }
}