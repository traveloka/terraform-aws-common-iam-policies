data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy_document" "policy" {
  statement {
    sid = "AllowToListCodepipelinePipelines"

    effect = "Allow"

    actions = [
      "codepipeline:ListPipelines",
    ]

    resources = [
      "arn:aws:codepipeline:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*",
    ]
  }

  statement {
    sid = "AllowToManageCodepipelinePipeline"

    effect = "Allow"

    actions = [
      "codepipeline:CreatePipeline",
      "codepipeline:DeletePipeline",
      "codepipeline:GetPipeline",
      "codepipeline:GetPipelineExecution",
      "codepipeline:GetPipelineState",
      "codepipeline:ListPipelineExecutions",
      "codepipeline:StartPipelineExecution",
      "codepipeline:UpdatePipeline",
    ]

    resources = [
      "arn:aws:codepipeline:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToManageCodepipelineStage"

    effect = "Allow"

    actions = [
      "codepipeline:DisableStageTransition",
      "codepipeline:EnableStageTransition",
      "codepipeline:RetryStageExecution",
    ]

    resources = [
      "arn:aws:codepipeline:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.product_domain}*/*",
    ]
  }

  statement {
    sid = "AllowToPassRole"

    effect = "Allow"

    actions = [
      "iam:PassRole",
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/service-role/codebuild.amazonaws.com/ServiceRoleForCodebuild_${var.product_domain}*",
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/service-role/codepipeline.amazonaws.com/ServiceRoleForCodepipeline_${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToCreateCodebuildProject"

    effect = "Allow"

    actions = [
      "codebuild:CreateProject",
      "codebuild:CreateWebhook",
    ]

    resources = [
      "arn:aws:codebuild:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:project/${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToManageCodebuildProject"

    effect = "Allow"

    actions = [
      "codebuild:DeleteProject",
      "codebuild:DeleteWebhook",
      "codebuild:UpdateProject",
      "codebuild:UpdateWebhook",
    ]

    resources = [
      "arn:aws:codebuild:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:project/${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToListCodebuildProject"

    effect = "Allow"

    actions = [
      "codebuild:BatchGetProjects",
      "codebuild:ListProjects",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowToManageCodebuildBuild"

    effect = "Allow"

    actions = [
      "codebuild:BatchDeleteBuilds",
      "codebuild:BatchGetBuilds",
      "codebuild:ListBuildsForProject",
      "codebuild:StartBuild",
      "codebuild:StopBuild",
    ]

    resources = [
      "arn:aws:codebuild:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:project/${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToGetEventRule"

    effect = "Allow"

    actions = [
      "events:ListRuleNamesByTarget",
    ]

    resources = [
      "arn:aws:events:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*",
    ]
  }

  statement {
    sid = "AllowToAccessCloudwatch"

    effect = "Allow"

    actions = [
      "cloudwatch:ListMetrics",
      "cloudwatch:GetMetricStatistics",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowToPutParameter"

    effect = "Allow"

    actions = [
      "ssm:PutParameter",
      "ssm:AddTagsToResource",
    ]

    resources = [
      "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/tvlk-secret/codebuild/${var.product_domain}/*",
    ]
  }

  statement {
    sid = "AllowToGetParameter"

    effect = "Allow"

    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
      "ssm:ListTagsForResource",
    ]

    resources = [
      "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/tvlk-secret/codebuild/${var.product_domain}/*",
    ]
  }

  statement {
    sid = "AllowToListKMSKeys"

    effect = "Allow"

    actions = [
      "kms:ListResourceTags",
      "kms:ListKeys",
      "kms:ListAliases",
    ]

    resources = ["*"]
  }

  statement {
    sid = "AllowToEncryptParameter"

    effect = "Allow"

    actions = [
      "kms:Encrypt",
    ]

    resources = [
      "${var.parameter_kms_key_arn}",
    ]
  }

  statement {
    sid = "AllowToDeleteParameter"

    effect = "Allow"

    actions = [
      "ssm:DeleteParameter",
      "ssm:DeleteParameters",
    ]

    resources = [
      "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/tvlk-secret/codebuild/${var.product_domain}/*",
    ]
  }

  statement {
    sid = "AllowToDescribeParameters"

    effect = "Allow"

    actions = [
      "ssm:DescribeParameters",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowToDescribeLogGroups"

    effect = "Allow"

    actions = [
      "logs:DescribeLogGroups",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:*",
    ]
  }

  statement {
    sid = "AllowToManageLogGroupForCodeBuild"

    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:PutRetentionPolicy",
      "logs:ListTagsLogGroup",
      "logs:TagLogGroup",
      "logs:DeleteLogGroup",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${var.product_domain}*",
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${var.product_domain}*:*",
    ]
  }

  statement {
    sid = "AllowToDescribeLogStreams"

    effect = "Allow"

    actions = [
      "logs:DescribeLogStreams",
      "logs:GetLogEvents",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${var.product_domain}*:log-stream:*",
    ]
  }

  statement {
    sid = "AllowToListAllBuckets"

    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    sid = "AllowToListTFStateBucket"

    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::${var.terraform_state_bucket_name}",
    ]
  }

  statement {
    sid = "AllowToAccessTFState"

    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/general/vpc/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/ami-baking-shared-resources/beisami/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/ami-baking-shared-resources/pd/${var.product_domain}/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/ami-baking/${var.product_domain}/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/java-build-shared-resources/pd/${var.product_domain}/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/java-build/${var.product_domain}/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/postgres-proxy-publishing-shared-resources/pd/${var.product_domain}/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/postgres-proxy-publishing/${var.product_domain}/*",
    ]
  }

  statement {
    sid = "AllowToWriteTFState"

    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/ami-baking/${var.product_domain}/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/java-build/${var.product_domain}/*",
      "arn:aws:s3:::${var.terraform_state_bucket_name}/${data.aws_region.current.name}/postgres-proxy-publishing/${var.product_domain}/*",
    ]
  }

  statement {
    sid = "AllowToAccessDynamoDB"

    effect = "Allow"

    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
    ]

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.terraform_state_bucket_name}",
    ]
  }

  statement {
    sid = "AllowToListTables"

    effect = "Allow"

    actions = [
      "dynamodb:ListTables",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowToDeregisterAMI"
    effect = "Allow"

    actions = [
      "ec2:DescribeImageAttribute",
      "ec2:DescribeImages",
      "ec2:DescribeTags",
      "ec2:DeregisterImage",
    ]

    resources = [
      "*",
    ]
  }
}
