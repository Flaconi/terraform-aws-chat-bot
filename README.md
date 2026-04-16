# Terraform AWS Chatbot Module

<!-- Uncomment and replace with your module name
[![lint](https://github.com/flaconi/<MODULENAME>/workflows/lint/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/<MODULENAME>/workflows/test/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/<MODULENAME>.svg)](https://github.com/flaconi/<MODULENAME>/releases)
-->
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

## Usage

```hcl
module "chatbot" {
	source = "github.com/Flaconi/terraform-aws-chat-bot"

	configuration_name    = "sample-alerts"
	guardrail_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
	iam_role_arn          = "arn:aws:iam::123456789012:role/aws-chatbot-role"
	slack_team_name       = "sample-slack-workspace"
	slack_channel_id      = "C00000000"

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn)

Description: IAM role ARN used by AWS Chatbot

Type: `string`

### <a name="input_slack_team_name"></a> [slack\_team\_name](#input\_slack\_team\_name)

Description: Slack workspace (team) name integrated with AWS Chatbot

Type: `string`

### <a name="input_slack_channel_id"></a> [slack\_channel\_id](#input\_slack\_channel\_id)

Description: Slack channel ID where AWS notifications are sent

Type: `string`

### <a name="input_sns_topic_arns"></a> [sns\_topic\_arns](#input\_sns\_topic\_arns)

Description: SNS topic ARNs used by the Chatbot Slack channel configuration

Type: `list(string)`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_configuration_name"></a> [configuration\_name](#input\_configuration\_name)

Description: AWS Chatbot configuration name

Type: `string`

Default: `null`

### <a name="input_guardrail_policy_arns"></a> [guardrail\_policy\_arns](#input\_guardrail\_policy\_arns)

Description: IAM policy ARNs attached to the Chatbot role and configured as Chatbot guardrails

Type: `list(string)`

Default:

```json
[
  "arn:aws:iam::aws:policy/ReadOnlyAccess"
]
```

### <a name="input_logging_level"></a> [logging\_level](#input\_logging\_level)

Description: Logging level for AWS Chatbot. Allowed values: ERROR, INFO, NONE

Type: `string`

Default: `"NONE"`

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

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2023 **[Flaconi GmbH](https://github.com/flaconi)**
