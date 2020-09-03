locals {
  datadog_account_id = "464622532012"
}

# Create IAM Role
module "aws-iam-role_datadog-integration" {
  source  = "traveloka/iam-role/aws//modules/external/"
  version = "v1.0.2"

  role_name        = "DatadogIntegration"
  role_description = "Role for Datadog-AWS integration"

  product_domain = "tsi"
  environment    = "staging"

  account_id  = local.datadog_account_id
  external_id = "SOMETHING_RANDOM_PROVIDED_BY_THE_3RD_PARTY"
}

# Create IAM Policy, using this module
module "aws-common-iam-policies_datadog-integration" {
  source = "../../modules/datadog-integration/"
}

# Attach the policy to the role as inline policy
resource "aws_iam_role_policy" "datadog-integration" {
  name   = "DatadogIntegration"
  role   = module.aws-iam-role_datadog-integration.role_name
  policy = module.aws-common-iam-policies_datadog-integration.policy_json
}

