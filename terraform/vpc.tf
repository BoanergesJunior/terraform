resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

data "aws_availability_zones" "all_az" {}

resource "aws_subnet" "subnets" {
  count = 2
  vpc_id = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.all_az.names[count.index]
  tags = {
    Name = "${var.prefix}-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.prefix}-rtb"
  }
}

resource "aws_route_table_association" "rtb-association" {
  count = 2
  route_table_id = aws_route_table.rtb.id
  subnet_id = aws_subnet.subnets.*.id[count.index]
}
