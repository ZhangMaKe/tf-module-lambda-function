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