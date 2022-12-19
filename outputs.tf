output "random" {
  description = "The generated random string."
  value       = "${var.prefix}${random_string.random.result}"
}
