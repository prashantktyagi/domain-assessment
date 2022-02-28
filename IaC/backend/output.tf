output "backend_bucket_name" {
  value = module.terraform_backend.bucket_name
}

output "backend_lock_db" {
  value = module.terraform_backend.lock_db
}