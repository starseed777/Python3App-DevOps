resource "aws_vpc" "jenkspython" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "jenkspython"
  }
}

resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.jenkspython.id
  cidr_block = var.publicsubnetcidr
  map_public_ip_on_launch = true

  tags = {
    Name = "jenkspython-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jenkspython.id

  tags = {
    Name : "jenkspythonIGW"
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.jenkspython.id
  route {
    cidr_block = var.public_ip
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRT-JenksPython"
  }
}

resource "aws_route_table_association" "pub_sub_association" {
  route_table_id = aws_route_table.publicRT.id
  subnet_id      = aws_subnet.publicsubnet.id 
}

resource "aws_security_group" "jenks_sg" {
  name        = "jenks_SG"
  vpc_id      = aws_vpc.jenkspython.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.public_ip]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_ip]

  }

  tags = {
    Name = "JENKS_SG"
  }
}

resource "aws_instance" "jenkins" {
  ami                  = var.aws_image
  instance_type        = var.aws_instance_type
  subnet_id            = aws_subnet.publicsubnet.id
  user_data            = file("vpcmod/jenks.sh")
  key_name             = var.aws_key
  security_groups      = [aws_security_group.jenks_sg.id]
  
    tags = {
    Name = "JENKINS-SERVER"
  }

}

