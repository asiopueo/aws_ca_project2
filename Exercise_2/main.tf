terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.00"
        }
    }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_lambda_function" "MyFabulousLambdaFunction" {
  filename = "greet_lambda.py"
  function_name = "greet_lambda"
  role = aws_iam_role.iam_for_lambda.arn
  handler = "exports.test"
  runtime = "python3.6"
}