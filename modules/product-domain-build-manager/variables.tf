variable "product_domain" {
  description = "Product domain these resources belong to."
  type        = string
}

variable "parameter_kms_key_arn" {
  description = "The ARN of the KMS key that the PDBM can use to encrypt parameters"
  type        = string
}

variable "terraform_state_bucket_name" {
  description = "The name of the bucket which store Terraform State files"
  type        = string
}

