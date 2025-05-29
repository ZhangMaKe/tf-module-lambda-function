data "archive_file" "zip_file" {
  type = "zip"
  source_file = var.source_file
  output_file_mode = "0666"
  output_path = var.output_path
}

resource "aws_lambda_function" "lambda_func" {
  filename         = data.archive_file.zip_file.output_path
  function_name    = var.function_name
  role            = var.role_arn
  handler         = "main.handler"
  runtime         = "python3.13"
  timeout         = 30
  publish         = true
  source_code_hash = data.archive_file.zip_file.output_base64sha256

  tracing_config {
    mode = var.enable_tracing == true ? "Active" : "PassThrough"
  }

  environment {
    variables = var.environment_variables
  }
}