data "aws_iam_policy_document" "policy" {
  statement {
    sid = "1"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "cloudwatch:PutMetricData",
    ]

    resources = [
      "*",
    ]
  }
  
  statement {
    sid = "2"
    effect = "Allow"

    actions = [
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:PutRetentionPolicy",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }

}
