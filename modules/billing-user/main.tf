data "aws_iam_policy_document" "policy" {
  statement {
    sid = "AllowView"

    actions = [
      "aws-portal:ViewAccount",
      "aws-portal:ViewBilling",
      "aws-portal:ViewBudget",
      "aws-portal:ViewPaymentMethods",
      "aws-portal:ViewUsage",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "DenyModify"
    effect = "Deny"

    actions = [
      "aws-portal:Modify*",
    ]

    resources = [
      "*",
    ]
  }
}

