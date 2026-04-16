variable "configuration_name" {
  type        = string
  description = "AWS Chatbot configuration name"
  default     = null
}

variable "iam_role_arn" {
  type        = string
  description = "IAM role ARN used by AWS Chatbot"
}

variable "slack_team_name" {
  type        = string
  description = "Slack workspace (team) name integrated with AWS Chatbot"
}

variable "slack_channel_id" {
  type        = string
  description = "Slack channel ID where AWS notifications are sent"
}

variable "sns_topic_arns" {
  type        = list(string)
  description = "SNS topic ARNs used by the Chatbot Slack channel configuration"
}

variable "guardrail_policy_arns" {
  type        = list(string)
  description = "IAM policy ARNs attached to the Chatbot role and configured as Chatbot guardrails"
  default     = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

variable "logging_level" {
  type        = string
  description = "Logging level for AWS Chatbot. Allowed values: ERROR, INFO, NONE"
  default     = "NONE"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to resources created by this module"
  default     = {}
}
