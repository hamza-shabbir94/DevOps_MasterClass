# create AWS s3 bucket
resource "aws_s3_bucket" "levelup_s3_bucket" {
  bucket = "levelup-s3-bucket-terraform"
}

# 1. Own the objects in the bucket to allow ACL usage
resource "aws_s3_bucket_ownership_controls" "levelup_s3_bucket_ownership" {
  bucket = aws_s3_bucket.levelup_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# 2. Apply the ACL (this now depends on the ownership controls)
resource "aws_s3_bucket_acl" "levelup_s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.levelup_s3_bucket_ownership]

  bucket = aws_s3_bucket.levelup_s3_bucket.id
  acl    = "private"
}

