# Output variable definition
/*
output "endpoint" {
  description = "Endpoint Information of the bucket"
  value       = aws_s3_bucket.s3_bucket.website_endpoint
}
*/

output "endpoint" {
  description = "Endpoint Information of the bucket"
  value = "${aws_s3_bucket.s3_bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}

/*
output "bucket_website_endpoint_url" {
  value = "http://${aws_s3_bucket.s3_bucket.website_endpoint}/index.html"
}
*/

output "bucket_website_endpoint_url" {
  description = "Endpoint Information of the bucket"
  value       = "http://${aws_s3_bucket.s3_bucket.bucket}.s3-website-${var.aws_region}.amazonaws.com"
}



