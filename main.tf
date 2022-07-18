resource "aws_s3_bucket" "state_file_bucket" {
    bucket = "talent-academy-tf-by-omkar"

    tags = {
      Name = "talent-academy-tf-by-omkar"
      Environment = "Lab"
    }

    lifecycle {
        prevent_destroy = true

    }
}

resource "aws_s3_bucket_versioning" "version_my_buckert" {
    bucket = aws_s3_bucket.state_file_bucket.id

    versioning_configuration {
      status = "Enabled"
    }
  
}