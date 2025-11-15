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

  dynamic "dead_letter_config" {
    for_each = var.use_sqs_dlq ? [1] : []
    content {
      target_arn = aws_sqs_queue.dlq[0].arn
    }
  }
}

resource "aws_sqs_queue" "dlq" {
  count = var.use_sqs_dlq ? 1 : 0
  name = "${var.function_name}-dlq"

  redrive_allow_policy = jsonencode({
    redrivePermission = "allowAll"
  })
}

resource "aws_sqs_queue_policy" "dlq_policy" {
  count = var.use_sqs_dlq ? 1 : 0
  queue_url = aws_sqs_queue.dlq[0].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.role_arn
        }
        Action = ["sqs:SendMessage"]
        Resource = aws_sqs_queue.dlq[0].arn
      }
    ]

  })
}