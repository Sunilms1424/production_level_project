variable "cidr" {
  description = "the value of cidr block"
  type = string
}
variable "cidr_block_public_subnet_1" {
  description = "the value of cidr for publicsubnet1"
  type = string
}
variable "cidr_block_private_subnet_1" {
  description = "the value of cidr for privatesubnet1"
  type = string
}
variable "cidr_block_public_subnet_2" {
  description = "the value of cider for publicsubnet2"
  type = string
}
variable "cidr_block_private_subnet_2" {
  description = "the value of cidr for privatesubnet2"
  type = string
}
variable "cidr_block_igw" {
  description = "the value of cidr block for route a traffic"
  type = string
}