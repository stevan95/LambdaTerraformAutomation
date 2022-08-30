resource "aws_iam_role" "lambda_role" {
  name = "lambda-s3-execution-role-test01-atlas"
  description = "AWS role for Lambda function"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_role-attached" {
  count      = "${length(var.iam_policy_arn)}"
  role       = aws_iam_role.lambda_role.name
  policy_arn = "${var.iam_policy_arn[count.index]}"
}
