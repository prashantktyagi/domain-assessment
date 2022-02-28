# EC2 instance profiles

# Generic instance role

data "aws_iam_policy" "aws_cwa_server" {
  name = "CloudWatchAgentServerPolicy"
}

resource "aws_iam_role" "ec2_instance_role" {
  name = "webserver_instance_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# Enable Cloudwatch access to instances
resource "aws_iam_role_policy_attachment" "cwa_policy_attach" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = data.aws_iam_policy.aws_cwa_server.arn
}

resource "aws_iam_instance_profile" "webserver" {
  name = "webserver-profile"
  role = aws_iam_role.ec2_instance_role.name
}