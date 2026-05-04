# AWS Provider Configuration
provider "aws" {
  region = "us-east-1" 
}

# 1. Security Group for Web and SSH access
resource "aws_security_group" "lab_sg" {
  name        = "terraform-lab-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. S3 Bucket
resource "aws_s3_bucket" "lab_bucket" {
  bucket = "terraform-lab-bucket-${var.student_name}-${data.aws_caller_identity.current.account_id}"
}

# 3. IAM Role and Instance Profile
resource "aws_iam_role" "lab_role" {
  name = "terraform-lab-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "lab_profile" {
  name = "terraform-lab-profile"
  role = aws_iam_role.lab_role.name
}

# 4. EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"
  
  vpc_security_group_ids = [aws_security_group.lab_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.lab_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from Terraform Lab!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "terraform-lab-ec2"
  }
}

# Variables & Data
variable "student_name" {
  default = "student"
}

data "aws_caller_identity" "current" {}
