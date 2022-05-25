data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "cluster" {
  name = var.cluster
}

data "aws_iam_policy_document" "trust_relationship" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${local.account_id}:oidc-provider/${local.cluster_oidc_issuer}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.cluster_oidc_issuer}:sub"
      values   = var.service_account_subjects
    }

    condition {
      test     = "StringEquals"
      variable = "${local.cluster_oidc_issuer}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}
