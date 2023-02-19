resource "aws_route_table" "public" {
    vpc_id = aws_vpc.my-vpc.id
    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "public-rt"
    }
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.my-vpc.id
    route = {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw.id
    }
    tags = {
        Name = "private-rt"
    }
}

resource "aws_route_table_association" "pub1" {
    subnet_id = aws_subnet.public-sub-1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "pub2" {
    subnet_id = aws_subnet.public-sub-2.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "priv1" {
    subnet_id = aws_subnet.private-sub-1.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "priv2" {
    subnet_id = aws_subnet.private-sub-2.id
    route_table_id = aws_route_table.private.id
}