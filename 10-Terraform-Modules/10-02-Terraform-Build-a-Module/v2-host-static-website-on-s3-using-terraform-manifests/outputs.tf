# Output variable definitions

output "arn" {
  description = "ARN of the S3 Bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "name" {
  description = "Name (id) of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}


output "domain" {
  description = "Domain Name of the bucket"
  value       = aws_s3_bucket.s3_bucket.website_domain
}

output "endpoint" {
  description = "Endpoint Information of the bucket"
  value       = aws_s3_bucket.s3_bucket.website_endpoint
}


output "endpoint-2" {
  description = "Endpoint Information of the bucket"
  value       = "http://${aws_s3_bucket.s3_bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com/"
}

