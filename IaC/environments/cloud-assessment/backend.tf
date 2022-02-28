terraform {
  backend "s3" {
    bucket         = "cloud-assessment-terraform-state-bucket"
    key            = "test/us-east-1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cloud-assessment-terraform-lockdb"
  }
}
