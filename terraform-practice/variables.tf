variable "region" {
    description = "Enter Region"
  
}

variable "aws_vpc" {
  description = "Enter CIDR for VPC"
}

variable "vpc-name" {
    description = "Enter VPC Name"
  
}

variable "Pub-subnet_cidr-1" {
    description = "Enter CIDR for Public Subnet"
  
}


variable "avail-zone-pub1" {
    description = "Enter AZ for subnet"
  
}



variable "pub-subnet-name-1" {
    description = "Enter Subnet Name"
  
}



variable "pvt-subnet-cidr-1" {
    description = "Enter CIDR for Public Subnet"
  
}


variable "avail-zone-pvt1" {
    description = "Enter AZ for subnet"
  
}

variable "pvt-subnet-name-1" {
    description = "Enter Subnet Name"
  
}





variable "Pub-subnet_cidr-2" {
    description = "Enter CIDR for Public Subnet"
  
}


variable "avail-zone-pub2" {
    description = "Enter AZ for subnet"
  
}



variable "pub-subnet-name-2" {
    description = "Enter Subnet Name"
  
}



variable "pvt-subnet-cidr-2" {
    description = "Enter CIDR for Public Subnet"
  
}


variable "avail-zone-pvt2" {
    description = "Enter AZ for subnet"
  
}

variable "pvt-subnet-name-2" {
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


variable "launch-temp-instance-name" {
  description = "Enter instance name for Launch templet"
}