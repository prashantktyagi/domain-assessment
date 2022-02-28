resource "aws_cloudwatch_log_group" "webserver" {
  name = "webserver"

  tags = local.tags
}