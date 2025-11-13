output "function_arn" {
  value = aws_lambda_function.lambda_func.arn
  description = "The ARN of the Lambda function"
}

output "invoke_arn" {
  value = aws_lambda_function.lambda_func.invoke_arn
  description = "The Invoke ARN of the Lambda function"
}

output "function_name" {
  value = aws_lambda_function.lambda_func.function_name
  description = "The name of the function"
}

output "sqs_dlq_arn" {
  value = var.use_sqs_dlq ? aws_sqs_queue.dlq[0].arn : null
  description = "ARN of the SQS Dead Letter Queue for failed events, if created."
}

output "sqs_dlq_url" {
  value = var.use_sqs_dlq ? aws_sqs_queue.dlq[0].id : null
  description = "URL of the SQS Dead Letter Queue for failed events, if created."
}