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

