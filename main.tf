provider "aws" {
  region     = var.aws-region
}

resource "aws_s3_bucket" "transcoder-buckets" {
  count         = length(var.s3_bucket_names) 
  bucket        = var.s3_bucket_names[count.index]
  force_destroy = true
}

resource "aws_s3_bucket_acl" "transcoder-buckets" {
  count  = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.transcoder-buckets[count.index].id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "transcoder-buckets" {
  count  = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.transcoder-buckets[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}