resource "aws_vpc" "my_vpc" {
    cidr_block = var.aws_vpc
    tags = {
      Name = var.vpc-name
    }

}

resource "aws_subnet" "my_subnet1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.Pub-subnet_cidr-1
    availability_zone = var.avail-zone-pub1
    tags = {
      Name = var.pub-subnet-name-1
    }
  
}


resource "aws_subnet" "my_subnet2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.pvt-subnet-cidr-1
    availability_zone = var.avail-zone-pvt1
    tags = {
      Name = var.pvt-subnet-name-1
    }
  
}




resource "aws_subnet" "my_subnet3" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.Pub-subnet_cidr-2
    availability_zone = var.avail-zone-pub2
    tags = {
      Name = var.pub-subnet-name-2
    }
  
}


resource "aws_subnet" "my_subnet4" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.pvt-subnet-cidr-2
    availability_zone = var.avail-zone-pvt2
    tags = {
      Name = var.pvt-subnet-name-2
    }
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
      Name = var.igw_name
    }
  
}


resource "aws_route_table" "My-route-table" {
  vpc_id = aws_vpc.my_vpc.id
  
  route {
    cidr_block = var.cidr_pub_route
    gateway_id = aws_internet_gateway.igw.id
  }

   tags = {
      Name = var.routename
    }
}

resource "aws_route_table_association" "route_association" {
    subnet_id = aws_subnet.my_subnet.id
    route_table_id = aws_route_table.My-route-table.id
  
}



resource "aws_eip" "nat_eip" {
  domain = "vpc"  
  tags = {
    Name = "NAT-EIP"
  }
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.my_subnet.id

  tags = {
    Name = var.nat-gw-name
  }
}

resource "aws_route_table" "Pvt-route-table" {
  vpc_id = aws_vpc.my_vpc.id

   route {
    cidr_block = var.cidr-pvt-route
    nat_gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = var.Route-name2
  }
  
}

resource "aws_route_table_association" "route-association-nat" {
  subnet_id = aws_subnet.my_subnet2.id
    route_table_id = aws_route_table.Pvt-route-table.id
   
}


# Security Group for ALB
resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.my_vpc.id 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB-Security-Group"
  }
}

# Application Load Balancer
resource "aws_lb" "my_alb" {
  name               = "My-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.my_subnet.id]

  tags = {
    Name = var.My-ALB
  }
}

# Target Group
resource "aws_lb_target_group" "my_target_group" {
  name     = "My-Target-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id  # Replace with your VPC ID variable or reference

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "My-Target-Group"
  }
}

# Listener for ALB
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}


