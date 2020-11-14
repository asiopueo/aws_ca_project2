# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.00"
    }
  }
}


provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacityT2" {
  count         = "4"
  ami           = "ami-xyz"
  instance_type = "t2.micro"
  subnet_id = ""
}



# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "udacityM4" {
  count         = "2"
  ami           = "ami-xyz"
  instance_type = "m4.large"
  subnet_id = ""
}