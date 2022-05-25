locals {
  account_id = data.aws_caller_identity.current.account_id

  cluster_oidc_issuer = replace(
    data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer,
    "https://",
    ""
  )
}
