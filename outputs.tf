output "chatbot_configuration_arn" {
  description = "ARN of the AWS Chatbot Slack channel configuration"
  value       = aws_chatbot_slack_channel_configuration.this.chat_configuration_arn
}

output "chatbot_configuration_name" {
  description = "Name of the AWS Chatbot Slack channel configuration"
  value       = aws_chatbot_slack_channel_configuration.this.configuration_name
}
