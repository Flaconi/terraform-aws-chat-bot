# Terraform AWS Chatbot Module

<!-- Uncomment and replace with your module name
[![lint](https://github.com/flaconi/<MODULENAME>/workflows/lint/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/<MODULENAME>/workflows/test/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/<MODULENAME>.svg)](https://github.com/flaconi/<MODULENAME>/releases)
-->
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

For requirements regarding module structure: [style-guide-terraform.md](https://github.com/Flaconi/devops-docs/blob/master/doc/conventions/style-guide-terraform.md)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

## Usage

```hcl
module "chatbot" {
	source = "github.com/Flaconi/terraform-aws-chat-bot"

	name             = "sample-alerts"
	iam_role_arn     = "arn:aws:iam::123456789012:role/aws-chatbot-role"
	slack_team_id    = "T00000000"
	slack_channel_id = "C00000000"

	sns_topic_arns = [
		"arn:aws:sns:eu-central-1:123456789012:sample-alerts"
	]

	logging_level = "ERROR"

	tags = {
		Terraform = "true"
		Service   = "chatbot"
	}
}
```

## Resources

The module creates:

- 1 AWS Chatbot Slack channel configuration

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

### <a name="input_name"></a> [name](#input\_name)

Description: Base name used for resources created by this module

Type: `string`

### <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn)

Description: IAM role ARN used by AWS Chatbot

Type: `string`

### <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input\_slack\_channel\_id)

Description: Slack channel ID where AWS notifications are sent

Type: `string`

### <a name="input_slack_team_id"></a> [slack\_team\_id](#input\_slack\_team\_id)

Description: Slack workspace (team) ID integrated with AWS Chatbot

Type: `string`

### <a name="input_sns_topic_arns"></a> [sns\_topic\_arns](#input\_sns\_topic\_arns)

Description: SNS topic ARNs used by the Chatbot Slack channel configuration

Type: `list(string)`

## Optional Inputs

### <a name="input_configuration_name"></a> [configuration\_name](#input\_configuration\_name)

Description: AWS Chatbot configuration name

Type: `string`

Default: `null`

### <a name="input_guardrail_policy_arns"></a> [guardrail\_policy\_arns](#input\_guardrail\_policy\_arns)

Description: IAM policy ARNs attached to the Chatbot role and configured as Chatbot guardrails

Type: `list(string)`

Default: `["arn:aws:iam::aws:policy/ReadOnlyAccess"]`

### <a name="input_logging_level"></a> [logging\_level](#input\_logging\_level)

Description: Logging level for AWS Chatbot. Allowed values: ERROR, INFO, NONE

Type: `string`

Default: `"ERROR"`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Tags applied to resources created by this module

Type: `map(string)`

Default: `{}`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_chatbot_configuration_arn"></a> [chatbot\_configuration\_arn](#output\_chatbot\_configuration\_arn) | ARN of the AWS Chatbot Slack channel configuration |
| <a name="output_chatbot_configuration_name"></a> [chatbot\_configuration\_name](#output\_chatbot\_configuration\_name) | Name of the AWS Chatbot Slack channel configuration |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of the IAM role used by AWS Chatbot |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2023 **[Flaconi GmbH](https://github.com/flaconi)**
