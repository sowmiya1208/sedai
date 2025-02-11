output "instance_ids" {
  value = aws_instance.nginx[*].id
}
