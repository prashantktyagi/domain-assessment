
##################################################
#  Webserver EC2
##################################################

resource "aws_security_group" "webserver" {
  name_prefix = "webserver-"
  description = "webserver security group"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
  tags = var.tags
}

resource "aws_security_group_rule" "ingress_rules" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # outside access
  description       = "allow only secure HTTP access"
  security_group_id = aws_security_group.webserver.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "egress_rules" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow access to internet"
  security_group_id = aws_security_group.webserver.id

  lifecycle {
    create_before_destroy = true
  }
}

### Instance definitions ###

resource "aws_instance" "webserver" {
  ami                         = var.ami
  ebs_optimized               = true
  instance_type               = var.instance_type
  key_name                    = var.keypair_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.webserver.id]
  source_dest_check           = true
  iam_instance_profile        = var.iam_instance_profile
  user_data = file("${path.module}/user-data/init.sh")

  root_block_device {
    volume_type           = "gp3"
    volume_size           = var.root_volume_size # 20
    delete_on_termination = true
    encrypted             = true # encryption at rest
  }

  tags = merge(
    {
      "Name" = "webserver"
    },
    var.tags
  )
}
