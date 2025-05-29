output "function_arn" {
  value = aws_lambda_function.lambda_func.arn
  description = "The ARN of the Lambda function"
}