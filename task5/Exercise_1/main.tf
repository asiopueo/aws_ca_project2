# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.00"
    }
  }
}

# TODO: Declare cloud service provider
provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

# TODO: VPC
resource provision "aws_vpc" "udacityVPC" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Udacity CAND Project 2 - VPC"
  }
}

# TODO: subnet
resource provision "aws_subnet" "udacitySubnet" {
  vpc_id = aws_vpc.udacityVPC.id
  cidr_block = "10.1.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Udacity CAND Project 2- Private Subnet"
  }
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacityT2" {
  count         = "4"
  ami           = "ami-00a205cb8e06c3c4e"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "Udacity CAND Project 2 - Udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "udacityM4" {
  count         = "2"
  ami           = "ami-00a205cb8e06c3c4e"
  instance_type = "m4.large"
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "Udacity CAND Project 2 - Udacity M4"
  }
}