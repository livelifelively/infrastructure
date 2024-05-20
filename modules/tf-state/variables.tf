
variable "bucket" {
  description = "Name of remote S3 Bucket where save the terraform state"
  type        = string
}

variable "dynamodb_table" {
  description = "Name of remote DynamoDB table to store terraform locks"
  type        = string
}

variable "key" {
  description = "key name to find state file inside s3 bucket"
  type        = string
}

variable "region" {
  description = "region of the backend s3 bucket and dynamodb table"
  type        = string
}
