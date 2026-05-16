# role to access s3 bucket
resource "aws_iam_role" "s3_levelup_access_role" {
  name = "s3_levelup_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# attach policy to role
resource "aws_iam_role_policy" "s3_levelupmybucket_role_policy" {
    name = "s3_levelupmybucket_role_policy"
    role = aws_iam_role.s3_levelup_access_role.id
    
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Action = [
            "s3:ListBucket",
            "s3:GetObject",
            "s3:PutObject"
            ]
            Resource = [
            aws_s3_bucket.levelup_s3_bucket.arn,
            "${aws_s3_bucket.levelup_s3_bucket.arn}/*"
            ]
        }
        ]
    })
}

# instance profile to attach role to EC2 instance
resource "aws_iam_instance_profile" "s3_levelup_access_instance_profile" {
  name = "s3_levelup_access_instance_profile"
  role = aws_iam_role.s3_levelup_access_role.name
}