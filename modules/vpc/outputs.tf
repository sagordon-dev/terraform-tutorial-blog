output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnets" {
  value = concat(aws_subnet.public.*.id, aws_subnet.private.*.id)
  # value = [aws_subnet.public.id, aws_subnet.private.id]
  description = "List of subnet IDs"
}
