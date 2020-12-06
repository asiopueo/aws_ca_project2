terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.00"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_lambda_function" "MyFabulousLambdaFunction" {
  filename      = "greet_lambda.zip"
  function_name = "greet_lambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "greet_lambda.handler"
  runtime       = "python3.6"
}