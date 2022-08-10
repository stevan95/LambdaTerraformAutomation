provider "aws" {
  region     = var.aws-region
}

resource "aws_s3_bucket" "transcoder-bucket_1" {
  bucket        = var.s3_bucket_1
  force_destroy = true
}

resource "aws_s3_bucket_acl" "transcoder-bucket_1" {
  bucket = aws_s3_bucket.transcoder-bucket_1.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "transcoder-bucket_1" {
  bucket = aws_s3_bucket.transcoder-bucket_1.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "transcoder-bucket_2" {
  bucket        = var.s3_bucket_2
  force_destroy = true
}

resource "aws_s3_bucket_acl" "transcoder-bucket_2" {
  bucket = aws_s3_bucket.transcoder-bucket_2.id
  acl    = "private"
}