output "ec2_public_ip" {
  value = aws_instance.safran_server.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.safran_bucket.bucket
}