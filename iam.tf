resource "aws_iam_role" "role" {
  name = var.role_name

  assume_role_policy = data.aws_iam_policy_document.trust_relationship.json
}

resource "aws_iam_role_policy_attachment" "role_policy" {
  for_each = { for arn in var.policy_attachments : arn => true }

  role       = aws_iam_role.role.name
  policy_arn = each.key
}
