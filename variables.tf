variable "source_file" {
  type = string
  description = "path to directory containing the source code"
}

variable "output_path" {
  type = string
  description = "path to the output zip file"  
}

variable "function_name" {
  type = string
  description = "name of the Lambda function"
}

variable "role_arn" {
  type = string
  description = "ARN of the IAM role that the Lambda function will assume" 
}

variable "enable_tracing" {
  type = bool
  default = true
  description = "Enable X-Ray tracing for the Lambda function" 
}

variable "environment_variables" {
  type = map(string)
  default = {}
  description = "Environment variables for the Lambda function"
}

variable "use_sqs_dlq" {
  type = bool
  default = false
  description = "boolean, if true creates an sqs queue and configures failed events to be sent to it."
}