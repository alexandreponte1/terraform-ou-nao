resource "aws_vpc" "dev-goku" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.common_tags, { Name = "dev-goku VPC " })
}

resource "aws_internet_gateway" "dev-goku" {
  vpc_id = aws_vpc.dev-goku.id
  tags   = merge(local.common_tags, { Name = "dev-goku IGW " })
}

resource "aws_subnet" "pub_a" {
  vpc_id            = aws_vpc.dev-goku.id
  cidr_block        = "192.168.0.0/25"
  availability_zone = "${var.aws_region}a"
  tags              = merge(local.common_tags, { Name = "dev-goku Public A" })

}

resource "aws_subnet" "pub_b" {
  vpc_id            = aws_vpc.dev-goku.id
  cidr_block        = "192.168.4.0/25"
  availability_zone = "${var.aws_region}b"
  tags              = merge(local.common_tags, { Name = "dev-goku Public B" })

}


resource "aws_subnet" "pvt_a" {
  vpc_id            = aws_vpc.dev-goku.id
  cidr_block        = "192.168.10.0/25"
  availability_zone = "${var.aws_region}a"
  tags              = merge(local.common_tags, { Name = "dev-goku Private A" })

}

resource "aws_subnet" "pvt_b" {
  vpc_id            = aws_vpc.dev-goku.id
  cidr_block        = "192.168.16.0/25"
  availability_zone = "${var.aws_region}b"
  tags              = merge(local.common_tags, { Name = "dev-goku Private B" })

}

resource "aws_subnet" "pvt_c" {
  vpc_id            = aws_vpc.dev-goku.id
  cidr_block        = "192.168.20.0/25"
  availability_zone = "${var.aws_region}c"
  tags              = merge(local.common_tags, { Name = "dev-goku Private C" })

}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.dev-goku.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-goku.id
  }

  tags = merge(local.common_tags, { Name = "dev-goku Public" })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev-goku.id
  tags   = merge(local.common_tags, { Name = "dev-goku Private" })
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pub_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pub_b.id
  route_table_id = aws_route_table.public.id
}



resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.pvt_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.pvt_b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id      = aws_subnet.pvt_c.id
  route_table_id = aws_route_table.private.id
}