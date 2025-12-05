# Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open SSH (not recommended for production)
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# DevOps Pratice ami-09c813fb71547fc4f
resource "aws_instance" "ec2" {
  ami             = "ami-09c813fb71547fc4f"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "Terraform-EC2"
  }
}