data "aws_chatbot_slack_workspace" "workspace" {
  slack_team_name = var.slack_team_name
}

resource "aws_chatbot_slack_channel_configuration" "this" {
  configuration_name    = var.configuration_name
  iam_role_arn          = var.iam_role_arn
  slack_channel_id      = var.slack_channel_id
  slack_team_id         = data.aws_chatbot_slack_workspace.workspace.slack_team_id
  sns_topic_arns        = var.sns_topic_arns
  logging_level         = var.logging_level
  guardrail_policy_arns = var.guardrail_policy_arns
  tags                  = var.tags
}
