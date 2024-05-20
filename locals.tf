locals {
  bucket_name = "tf-state-bucket.${var.project_name}"
  table_name  = "tf_state_locking.${var.project_name}"
}
