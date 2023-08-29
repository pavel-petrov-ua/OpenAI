provider "aws" {
  region = "us-east-1"  # Встановіть ваш регіон AWS
}

resource "aws_instance" "jenkins_instance" {
  ami           = "ami-053b0d53c279acc90"  # Ubuntu 22.04 LTS AMI
  instance_type = "t2.micro"  # Виберіть тип інстансу відповідно до ваших потреб

  tags = {
    Name = "JenkinsInstance"
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Security group for Jenkins instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Додайте інші правила за потреби
}