provider "aws" {
  region = "us-east-1"
}

module "terraform_backend" {
  source = "../modules/terraform-s3-backend"
  name_prefix = "cloud-assessment"

  tags = {
      Owner = "Prashant"
      purpose = "Interview"
      Managedby = "Terraform"
  }
}
