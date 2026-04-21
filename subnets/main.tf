# resource "aws_subnet" "main" {
#   vpc_id     = var.vpc
#   cidr_block = "10.0.1.0/24"
#
#   tags = {
#     Name = "Main"
#   }
# }