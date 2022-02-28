locals {
  ami_id = "ami-033b95fb8079dc481"
  instance_type = "t3.micro"
  keypair_name = "prashant"
  vpc_id = "vpc-0da50b7aff4d9520d"
  subnet_id = "subnet-09d1c07e50706e382"
  tags = {
      Owner = "Prashant"
      environment = "Interview"
      Managedby = "Terraform"
      assessment-day = "Monday"
  }
}