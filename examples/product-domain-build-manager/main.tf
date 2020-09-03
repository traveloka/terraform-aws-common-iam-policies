locals {
  product_domain = "tsi"
}

# Create IAM Role
module "aws-iam-role_product-domain-build-manager" {
  source  = "traveloka/iam-role/aws//modules/user/"
  version = "v1.0.2"

  role_name        = "ProductDomainBuildManager_${local.product_domain}"
  role_description = "Role for Build Manager of ${local.product_domain} Product Domain"

  product_domain = local.product_domain
  environment    = "staging"

  mfa_required = "false"

  trusted_users = [
    "arn:aws:sts::123456789012:assumed-role/SAMLUser/first.last@company.com",
  ]
}

# Create IAM Policies, using this module
module "aws-common-iam-policies_product-domain-build-manager" {
  source = "../../modules/product-domain-build-manager/"

  product_domain              = local.product_domain
  terraform_state_bucket_name = "terraform-state-management-dummy"
  parameter_kms_key_arn       = "arn:aws:kms:ap-southeast-1:123456789012:key/ea28f783-1234-5678-9012-7534a8f52100"
}

# Attach the policies to the role as inline policy
resource "aws_iam_role_policy" "product-domain-build-manager" {
  name   = "ProductDomainBuildManager"
  role   = module.aws-iam-role_product-domain-build-manager.role_name
  policy = module.aws-common-iam-policies_product-domain-build-manager.policy_json
}

