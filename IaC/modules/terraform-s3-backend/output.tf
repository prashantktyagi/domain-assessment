output "bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "lock_db" {
  value = aws_dynamodb_table.terraform_lock.name
}