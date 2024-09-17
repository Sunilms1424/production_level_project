provider "aws" {
  region = "us-east-1"
}
#creating vpc 
resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr
  tags = {
    Name="myvpc1"
  }
}
#creating public-subnet-1
resource "aws_subnet" "mypublic-subnet-1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_block_public_subnet_1
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
      Name = "mypublic-subnet-1"
    }
}
#creating private-subnet-1
resource "aws_subnet" "myprivate-subnet-1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_block_private_subnet_1
    availability_zone = "us-east-1a"
    tags = {
      Name = "myprivate-subnet-2"
    }
}
#creating public-subnet-2
resource "aws_subnet" "mypublic-subnet-2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.cidr_block_public_subnet_2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "mypublic-subnet-2"
  }
}
#creating private-subnet-2
resource "aws_subnet" "myprivate-subnet-2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cidr_block_private_subnet_2
    availability_zone = "us-east-1b"
    tags = {
      Name = "myprivate-subnet-2"
    }
}
# creating igw
resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = "myigw"
    }
}
#creating route table for public subnets
resource "aws_route_table" "mypublic-route-table"{
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "mypublic-route-table"
  }
  route  {
    cidr_block = var.cidr_block_igw
    gateway_id = aws_internet_gateway.myigw.id
  }
}
# creating the route table for private subnets-1
resource "aws_route_table" "myprivate-route-table-1" { 
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myprivate-route-table-1"
  }
}
#creating the route table for private subnets 2
resource "aws_route_table" "myprivate-route-table-2" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myprivate-route-table-2"
  } 
}
#creating the route table association for public subnets
resource "aws_route_table_association" "aws-route-table-association-pubsubnet-1" {
  route_table_id = aws_route_table.mypublic-route-table.id
  subnet_id = aws_subnet.mypublic-subnet-1.id
}
resource "aws_route_table_association" "aws-route-table-assocation-publicsubnet-2" {
  route_table_id = aws_route_table.mypublic-route-table.id
  subnet_id = aws_subnet.mypublic-subnet-2.id
}
resource "aws_route_table_association" "aws-route-table-association-privatesubnet-1" {
  route_table_id = aws_route_table.myprivate-route-table-1.id
  subnet_id = aws_subnet.myprivate-subnet-1.id
}
resource "aws_route_table_association" "aws-route-table-assocation-privatesubnet2" {
  route_table_id = aws_route_table.myprivate-route-table-2.id
  subnet_id = aws_subnet.myprivate-subnet-2.id
}
