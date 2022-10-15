resource "aws_s3_bucket" "backend_bucket" {
  bucket = "mystatefile-backend"
}
resource "aws_s3_bucket_versioning" "version" {
  bucket = aws_s3_bucket.backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.backend_bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
   }
  }
}
