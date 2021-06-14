/**
 * # terraform-aws-dlm-role
 *
 * Data Lifecycle Manager (DLM) role.
 *
 * Provides typical role with policies based on https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html
 */

data "aws_iam_policy_document" "assume_by_dlm" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
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

resource "aws_iam_role_policy_attachment" "snapshot" {
  count      = var.enable_snapshot_lifecycle ? 1 : 0
  role       = aws_iam_role.this.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSDataLifecycleManagerServiceRole"
}

resource "aws_iam_role_policy_attachment" "ami" {
  count      = var.enable_ami_lifecycle ? 1 : 0
  role       = aws_iam_role.this.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSDataLifecycleManagerServiceRoleForAMIManagement"
}
