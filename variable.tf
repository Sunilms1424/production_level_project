variable "cidr" {
  description = "the value of cidr block"
  type = string
}
variable "aws_vpc_name" {
  description = "the name of the vpc"
  type = string
}
variable "cidr_block_public_subnet_1" {
  description = "the value of cidr for publicsubnet1"
  type = string
}
variable "public_subnet1_name" {
  description = "the name of public subnet1"
  type = string
}
variable "cidr_block_private_subnet_1" {
  description = "the value of cidr for privatesubnet1"
  type = string
}
variable "privatesubnet1_subnet1_name" {
  description = "the name of private subnet1"
  type = string
}
variable "cidr_block_public_subnet_2" {
  description = "the value of cider for publicsubnet2"
  type = string
}
variable "public_subnet2_name" {
  description = "the name of public subnet2"
  type = string
}
variable "cidr_block_private_subnet_2" {
  description = "the value of cidr for privatesubnet2"
  type = string
}
variable "privatesubnet2_subnet2_name" {
  description = "the name of private subnet2"
  type = string
}
variable "cidr_block_igw" {
  description = "the value of cidr block for route a traffic"
  type = string
}