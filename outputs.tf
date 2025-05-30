output "function_arn" {
  value = aws_lambda_function.lambda_func.arn
  description = "The ARN of the Lambda function"
}

output "invoke_arns" {
  value = aws_lambda_function.lambda_func.invoke_arn
  description = "The Invoke ARN of the Lambda function"
}