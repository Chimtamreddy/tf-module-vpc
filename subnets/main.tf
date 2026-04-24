resource "aws_subnet" "main" {
  for_each = var.subnets
  vpc_id     = var.vpc_id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]
  tags = {
    Name = each.key
  }

}

resource "aws_route_table" "main" {
  for_each = var.subnets
  vpc_id = var.vpc_id

  tags = {
    Name = each.key
  }
}

# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.example.id
#   route_table_id = aws_route_table.example.id
# }

output "subnets" {
  value = var.subnets
}