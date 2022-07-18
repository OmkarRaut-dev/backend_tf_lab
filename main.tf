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


resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}