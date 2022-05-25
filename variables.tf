variable "cluster" {}

variable "role_name" {
  description = "The IAM Role Name"
}

variable "service_account_subjects" {
  description = "List of service account arns e.g system:serviceaccount:foo-ns:bar"
  type        = list(string)
}

variable "inline_policy_json" {
  description = "IAM JSON string to set as an inline role policy"
  default     = null
  type        = string
}

variable "policy_attachments" {
  description = "List of customer managed policy ARN's"

  default = []
  type    = list(string)
}
