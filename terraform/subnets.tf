############################
# PUBLIC SUBNETS
############################

resource "aws_subnet" "public" {
  for_each = { for idx, cidr in var.public_subnets : idx => cidr }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  availability_zone       = var.azs[tonumber(each.key)]
  map_public_ip_on_launch = true

  tags = {
    Name = "hyp-minds-dev-subnet-public${tonumber(each.key)+1}-${var.azs[tonumber(each.key)]}"
  }
}

############################
# PRIVATE SUBNETS
############################

resource "aws_subnet" "private" {
  for_each = { for idx, cidr in var.private_subnets : idx => cidr }

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  availability_zone       = var.azs[tonumber(each.key)]
  map_public_ip_on_launch = false

  tags = {
    Name = "hyp-minds-dev-subnet-private${tonumber(each.key)+1}-${var.azs[tonumber(each.key)]}"
  }
}

