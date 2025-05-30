# AWS Lambda Terraform Module

[![Terraform CI](https://github.com/ZhangMaKe/tf-module-lambda-function/actions/workflows/workflow.yml/badge.svg)](https://github.com/ZhangMaKe/tf-module-lambda-function/actions/workflows/workflow.yml)

This Terraform module provisions a Python AWS Lambda function using a provided source file, with support for environment variables, X-Ray tracing, and IAM role assignment.

## Features
- Packages and deploys a Lambda function from a specified source file
- Supports environment variables
- Enables/disables AWS X-Ray tracing
- Assigns an IAM role to the Lambda function
- Outputs the Lambda function ARN

## Usage
```hcl
module "lambda_function" {
  source = "./path-to-this-module"

  source_file           = "path/to/your/lambda.py"
  output_path           = "path/to/output/lambda.zip"
  function_name         = "my_lambda_function"
  role_arn              = "arn:aws:iam::123456789012:role/lambda-role"
  enable_tracing        = true
  environment_variables = {
    ENV_VAR1 = "value1"
    ENV_VAR2 = "value2"
  }
}
```

## Input Variables
| Name                  | Type         | Default | Description |
|-----------------------|--------------|---------|-------------|
| source_file           | string       | n/a     | Location of the lambda source code |
| output_path           | string       | n/a     | Path to the output zip file |
| function_name         | string       | n/a     | Name of the Lambda function |
| role_arn              | string       | n/a     | ARN of the IAM role that the Lambda function will assume |
| enable_tracing        | bool         | true    | Enable X-Ray tracing for the Lambda function |
| environment_variables | map(string)  | {}      | Environment variables for the Lambda function |

## Output Variables
| Name         | Description |
|--------------|-------------|
| function_arn | The ARN of the Lambda function |
| invoke_arn   | The invocation arn for the Lambda function |

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 0.13
- AWS credentials with permissions to create Lambda functions and IAM roles

## CI/CD
This repository includes a GitHub Actions workflow that runs [Trivy](https://github.com/aquasecurity/trivy) to scan Terraform code for misconfigurations on every push and pull request to the `main` branch.

## License
MIT
