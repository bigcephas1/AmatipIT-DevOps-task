resource "aws_subnet" "AmatipIT_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.avail_zones
  tags = {
    Name = "${local.prefix}-subnet"
  }
}

resource "aws_internet_gateway" "AmatipIT_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${local.prefix}-igw"
  }
}

resource "aws_route_table" "AmatipIT_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id  = aws_internet_gateway.AmatipIT_igw.id
    
  }
}

resource "aws_route_table_association" "AmatipIT_rt_association" {
  subnet_id      = aws_subnet.AmatipIT_subnet.id
  route_table_id = aws_route_table.AmatipIT_route_table.id

}


# add in subnet main.tf