module "chatbot" {
  source = "../../"

  configuration_name = "sample-alerts"
  iam_role_arn       = "arn:aws:iam::123456789012:role/aws-chatbot-role"
  slack_team_name    = "sample-slack-workspace"
  slack_channel_id   = "C00000000"
  logging_level      = "INFO"
  guardrail_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess"
  ]

  sns_topic_arns = [
    "arn:aws:sns:eu-central-1:123456789012:sample-alerts"
  ]

  tags = {
    Terraform = "true"
    Service   = "chatbot"
  }
}
