# Create IAM Role
module "aws-iam-role_commonec2" {
  source  = "traveloka/iam-role/aws//modules/instance/"
  version = "v1.0.2"

  product_domain = "tsi"
  service_name   = "tsicwa"
  cluster_role   = "app"
  environment    = "staging"
}

# Create IAM Policy, using this module
module "aws-common-iam-policies_commonec2" {
  source = "../../modules/commonec2/"
}

# Attach the policy to the role as inline policy
resource "aws_iam_role_policy" "commonec2" {
  name   = "commonec2"
  role   = "${module.aws-iam-role_commonec2.role_name}"
  policy = "${module.aws-common-iam-policies_commonec2.policy_json}"
}
