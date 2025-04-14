resource "aws_lambda_function" "example_lambda" {
  function_name = "example_lambda"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "index.lambda_handler"
  runtime       = "python3.9"

  source_code_hash = filebase64sha256("lambda/index.py")
  filename         = "lambda_function_payload.zip"

  depends_on = [null_resource.build_lambda]
}

resource "null_resource" "build_lambda" {
  provisioner "local-exec" {
    command = <<EOT
    mkdir -p lambda
    echo 'def lambda_handler(event, context):\n  return {"statusCode": 200, "body": "Hello from Lambda!"}' > lambda/index.py
    zip lambda_function_payload.zip lambda/index.py
    EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}
