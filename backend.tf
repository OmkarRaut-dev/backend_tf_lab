terraform {
  backend "s3" { 
    bucket = "talent-academy-tf-by-omkar"
    key = "Talent-Academy/Terraform_Labs/backend_tf_lab/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}