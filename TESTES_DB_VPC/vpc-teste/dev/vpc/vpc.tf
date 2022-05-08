resource "aws_vpc" "gohan" {
  cidr_block = "192.168.0.0/16"
  tags       = merge(local.common_tags, { Name = "${var.env} gohan VPC " })
}

resource "aws_internet_gateway" "dev-gohan" {
  vpc_id = aws_vpc.gohan.id
  tags   = merge(local.common_tags, { Name = "${var.env} gohan IGW " })
}

resource "aws_subnet" "pub_a" {
  vpc_id            = aws_vpc.gohan.id
  cidr_block        = "192.168.1.0/25"
  availability_zone = "${var.aws_region}a"
  tags              = merge(local.common_tags, { Name = "${var.env} gohan Public A" })

}

resource "aws_subnet" "pub_b" {
  vpc_id            = aws_vpc.gohan.id
  cidr_block        = "192.168.2.0/25"
  availability_zone = "${var.aws_region}b"
  tags              = merge(local.common_tags, { Name = "${var.env} gohan Public B" })

}


resource "aws_subnet" "pvt_a" {
  vpc_id            = aws_vpc.gohan.id
  cidr_block        = "192.168.3.0/25"
  availability_zone = "${var.aws_region}a"
  tags              = merge(local.common_tags, { Name = "${var.env} gohan Private A" })

}

resource "aws_subnet" "pvt_b" {
  vpc_id            = aws_vpc.gohan.id
  cidr_block        = "192.168.4.0/25"
  availability_zone = "${var.aws_region}b"
  tags              = merge(local.common_tags, { Name = "${var.env} gohan Private B" })

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.gohan.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gohan.id
  }

  tags = merge(local.common_tags, { Name = "${var.env} gohan Public" })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.gohan.id
  tags   = merge(local.common_tags, { Name = "${var.env} gohan Private" })
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pub_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pub_b.id
  route_table_id = aws_route_table.public.id
}
