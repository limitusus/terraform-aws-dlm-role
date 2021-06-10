/**
 * # terraform-aws-dlm-role
 *
 * Data Lifecycle Manager (DLM) role
 */

data "aws_iam_policy_document" "assume_by_dlm" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["dlm.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  path               = var.role_path
  description        = var.role_description
  assume_role_policy = data.aws_iam_policy_document.assume_by_dlm.json
  tags               = var.tags
}

resource "aws_iam_role_policy" "snapshot" {
  count  = var.enable_snapshot_lifecycle ? 1 : 0
  name   = "Snapshot"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.snapshot_lifecycle.json
}

resource "aws_iam_role_policy" "ami" {
  count  = var.enable_ami_lifecycle ? 1 : 0
  name   = "AMI"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.ami_lifecycle.json
}
