region = "ap-south-2"
aws_vpc = "10.0.0.0/24"
vpc-name = "My-Vpc"

Pub-subnet_cidr-1 = "10.0.0.0/26"
avail-zone-pub1 = "ap-south-2a"
pub-subnet-name-1 = "Pub-Subnet-1"

pvt-subnet-cidr-1 = "10.0.0.128/26"
avail-zone-pvt1 = "ap-south-2a"
pvt-subnet-name-1 = "Pvt-Subnet-1"


Pub-subnet_cidr-2 = "10.0.0.64/26"
avail-zone-pub2 = "ap-south-2b"
pub-subnet-name-2 = "Pub-Subnet-2"

pvt-subnet-cidr-2 = "10.0.0.192/26"
avail-zone-pvt2 = "ap-south-2b"
pvt-subnet-name-2 = "Pvt-Subnet-2"

igw_name = "My-IGW"
cidr_pub_route = "0.0.0.0/0"
routename = "Pub-Router"
Route-name2 = "Pvt-Router"
nat-gw-name = "My-Nat-GW"
cidr-pvt-route = "0.0.0.0/0"
My-ALB = "My-APP-LoadBalancer"
launch-temp-instance-name = "asg-instance"