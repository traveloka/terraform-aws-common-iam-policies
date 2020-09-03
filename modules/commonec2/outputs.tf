output "policy_json" {
  description = "An IAM Policy in JSON format"
  value       = data.aws_iam_policy_document.policy.json
}

