resource "aws_vpc" "main" {
  cidr_block = var.cidr
}

module "subnets" {
  source = "./subnets"

  for_each = var.subnets

  vpc_id = aws_vpc.main.id
  subnets = each.value
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route" "igw" {
  for_each = lookup(lookup(var.subnets, "public", null), "route_table", null)
  route_table_id            = each.key["id"]
  destination_cidr_block    = "0.0.0.0/0"
}

output "subnets" {
  value = module.subnets
}