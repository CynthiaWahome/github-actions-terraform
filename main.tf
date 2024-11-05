provider "aws" {
  region = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "subnet_id" {
  description = "The ID of the subnet"
}

data "aws_security_group" "default" {
  vpc_id = var.vpc_id
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Name = "HelloWorld"
  }
}