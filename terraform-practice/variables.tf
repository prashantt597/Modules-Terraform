variable "region" {
    description = "Enter Region"
  
}

variable "aws_vpc" {
  description = "Enter CIDR for VPC"
}

variable "vpc-name" {
    description = "Enter VPC Name"
  
}

variable "subnet_cidr" {
    description = "Enter CIDR for Public Subnet"
  
}


variable "sub-avail-zone-pub" {
    description = "Enter AZ for subnet"
  
}



variable "subnet-name" {
    description = "Enter Subnet Name"
  
}



variable "sub-avail-zone-pvt" {
    description = "Enter AZ for subnet"
  
}


variable "pvtsubnet_cidr" {
    description = "Enter CIDR for Public Subnet"
  
}

variable "pvtsubnet-name" {
    description = "Enter Subnet Name"
  
}

variable "igw_name" {
    description = "Enter IGW Name"
  
}

variable "cidr_pub_route" {
    description = "Enter CIDR for pub route table"
  
}


variable "routename" {
    description = "Enter Route table name"
  
}


variable "nat-gw-name" {
    description = "Enter name for NAT GW"
  
}


variable "cidr-pvt-route" {
    description = "Enter cidr for pvt route table"
  
}

variable "Route-name2" {
    description = "Name for Pvt route table"
  
}

variable "My-ALB" {
  description = "Enter Application Load Balancer Name"
}