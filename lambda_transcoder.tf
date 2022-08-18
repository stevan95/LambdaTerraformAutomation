data "archive_file" "layer-archive" {
  type        = "zip"
  source_dir = "layer/aws/nodejs"
  output_path = "nodejs.zip"
}

data "archive_file" "lambda-archive" {
  type        = "zip"
  source_file = "transcode-video/index.js"
  output_path = "lambda_transcoder.zip"
}

resource "aws_lambda_layer_version" "nodejs-aws-layer" {
  filename            = "nodejs.zip"
  layer_name          = "node_aws_layer"
  compatible_runtimes = ["nodejs16.x"]
}

resource "aws_lambda_function" "terraform_lambda_transcoder_func" {
  filename                       = "lambda_transcoder.zip"
  function_name                  = "transcode-video-atlas01"
  role                           = aws_iam_role.lambda_role.arn
  handler                        = "index.handler"
  runtime                        = "nodejs16.x"
  layers                         = [aws_lambda_layer_version.nodejs-aws-layer.arn]
  depends_on                     = [aws_iam_role.lambda_role]
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = aws_s3_bucket.transcoder-bucket_1.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_transcoder_func.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  }
}
resource "aws_lambda_permission" "test" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.terraform_lambda_transcoder_func.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${aws_s3_bucket.transcoder-bucket_1.id}"
}

