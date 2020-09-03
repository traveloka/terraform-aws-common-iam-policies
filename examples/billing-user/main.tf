# Create IAM Role
module "aws-iam-role_billing-user" {
  source  = "traveloka/iam-role/aws//modules/user"
  version = "v1.0.2"

  role_name        = "BillingUser"
  role_description = "Role for accessing Billing and Cost Management dashboard"

  product_domain = "tsi"
  environment    = "staging"

  mfa_required = "false"

  trusted_users = [
    "arn:aws:sts::123456789012:assumed-role/SAMLUser/first.last@company.com",
  ]
}

# Create an IAM Policy, using this module
module "aws-common-iam-policies_billing-user" {
  source = "../../modules/billing-user/"
}

# Attach the policy to the role as inline policy
resource "aws_iam_role_policy" "billing-user" {
  name   = "BillingUser"
  role   = module.aws-iam-role_billing-user.role_name
  policy = module.aws-common-iam-policies_billing-user.policy_json
}

