# terraform-aws-dlm-role

Data Lifecycle Manager (DLM) role.

Provides typical role with policies based on https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-lifecycle.html

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.snapshot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.ami_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_by_dlm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.snapshot_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_ami_lifecycle"></a> [enable\_ami\_lifecycle](#input\_enable\_ami\_lifecycle) | Enable AMI lifecycle management | `bool` | `false` | no |
| <a name="input_enable_snapshot_lifecycle"></a> [enable\_snapshot\_lifecycle](#input\_enable\_snapshot\_lifecycle) | Enable snapshot lifecycle management | `bool` | `false` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | DLM Role description | `string` | `"AWS DLM Role"` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | DLM Role name | `string` | `"AWSDataLifecycleManagerRole"` | no |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | DLM Role path | `string` | `"/"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | Role ARN |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Role name |
