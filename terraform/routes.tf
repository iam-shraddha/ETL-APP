
############################
# PUBLIC ROUTE TABLE
############################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  # Public subnets get internet access through IGW
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "hyp-minds-dev-rtb-public"
  }
}

resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

############################
# PRIVATE ROUTE TABLES (NO INTERNET)
############################

resource "aws_route_table" "private" {
  for_each = aws_subnet.private

  vpc_id = aws_vpc.this.id

  # No default route, these subnets stay isolated
  tags = {
    Name = "hyp-minds-dev-rtb-private${each.key}"
  }
}

resource "aws_route_table_association" "private_assoc" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}
