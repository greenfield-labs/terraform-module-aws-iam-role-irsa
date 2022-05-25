resource "aws_iam_role" "role" {
  name = var.role_name

  assume_role_policy = data.aws_iam_policy_document.trust_relationship.json
}

resource "aws_iam_role_policy" "policy" {
  count = var.inline_policy_json == null ? 0 : 1

  name = var.role_name
  role = aws_iam_role.role.id

  policy = var.inline_policy_json
}

resource "aws_iam_role_policy_attachment" "role_policy" {
  for_each = toset(var.policy_attachments)

  role       = aws_iam_role.role.name
  policy_arn = each.key
}
