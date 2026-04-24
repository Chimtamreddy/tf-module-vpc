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

output "subnets" {
  value = module.subnets
}