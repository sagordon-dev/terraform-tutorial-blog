output "instance_id" {
  value = aws_instance.app_server.id
}

output "app_lb_arn" {
  value = aws_lb.app_lb.arn
  description = "The ARN of the application laod balancer"
}