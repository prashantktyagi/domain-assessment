module "webserver" {
  source = "../../modules/ec2-webserver"

  ami = local.ami_id
  vpc_id = local.vpc_id # module.vpc.vpc_id
  subnet_id = local.subnet_id # module.vpc.public_subnets[0]
  instance_type = local.instance_type
  iam_instance_profile = aws_iam_instance_profile.webserver.name
  keypair_name = local.keypair_name

  tags = local.tags
}