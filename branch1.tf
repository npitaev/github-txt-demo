# This file will create AWS Infrastructure (VPC, Subnets, IGW) 

# Create Branch VPC:

resource "aws_vpc" "vpc_branch1" {
  cidr_block			= "10.111.0.0/16"
  provider 				= aws.branch1
  tags = {
    Name = "Branch1 VPC"
  }
}

# Create Subnets for Branch VPC:

resource "aws_subnet" "branch1_vpc_subnet1" {
    vpc_id 				= aws_vpc.vpc_branch1.id
    cidr_block 			= "10.111.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-west-2b"
    tags = {
        Name = "Branch1 Subnet-1 Mgmt"
    }
}

resource "aws_subnet" "branch1_vpc_subnet2" {
    vpc_id 				= aws_vpc.vpc_branch1.id
    cidr_block 			= "10.111.2.0/24"
    availability_zone 	= "us-west-2b"
    tags = {
        Name = "Branch1 Subnet-2 VPN0"
    }
}

# Create IGW for Internet Access:

resource "aws_internet_gateway" "branch1_vpc_igw" {
    vpc_id = aws_vpc.vpc_branch1.id
    tags = {
        Name = "Branch1 VPC IGW"
    }
}
