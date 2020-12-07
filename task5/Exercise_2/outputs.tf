# TODO: Define the output variable for the lambda function.

output "lambda_fct_name" {
  description = "Name of the lambda function"
  value = aws_lambda_function.my_lambda_fct.function_name
}