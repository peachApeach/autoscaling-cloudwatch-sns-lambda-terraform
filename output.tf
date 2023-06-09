output "userData" {
  value = aws_launch_template.launchTemp.user_data
}

output "path" {
  value       = "${path.module}"
}