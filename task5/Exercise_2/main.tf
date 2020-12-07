terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.00"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "greet_lambda.zip"
}

resource "aws_lambda_function" "my_lambda_fct" {
  filename      = "greet_lambda.zip"
  function_name = "greet_lambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "greet_lambda.lambda_handler"
  runtime       = "python3.6"
  environment {
    variables = {
      greeting = "Live long and prosper"
    }
  }
}

