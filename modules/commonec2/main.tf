data "aws_iam_policy_document" "policy" {
  # Allow creation of log groups
  statement {
    sid       = "1"
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup"]
    resources = ["*"]
  }

  # Allow creation of log streams and retention policies on the log group
  statement {
    sid    = "2"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutRetentionPolicy",
    ]

    resources = ["arn:aws:logs:*:*:log-group:*"]
  }

  # Allow sending log events to log streams
  statement {
    sid       = "3"
    effect    = "Allow"
    actions   = ["logs:PutLogEvents"]
    resources = ["arn:aws:logs:*:*:log-group:*:log-stream:*"]
  }

  # Allow sending metrics
  statement {
    sid       = "4"
    effect    = "Allow"
    actions   = ["cloudwatch:PutMetricData"]
    resources = ["*"]
  }
}
