# Create S3 Bucket Resource
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_website" {
  bucket = var.bucket_name
  index_document {
    suffix = "index.html"
  }
  # Other website configurations...
}


resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket     = var.bucket_name
  acl        = "public-read"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = var.bucket_name
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.s3_bucket_pab]
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_pab" {
  bucket = var.bucket_name

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = var.bucket_name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "PublicReadGetObject",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : [
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })

  depends_on = [aws_s3_bucket_acl.s3_bucket_acl]
}

# Put index.html in S3 Bucket
resource "aws_s3_object" "bucket" {
  acl          = "public-read"
  key          = "index.html"
  bucket       = aws_s3_bucket.s3_bucket.id
  content      = file("${path.module}/static-files/index.html")
  content_type = "text/html"
}
