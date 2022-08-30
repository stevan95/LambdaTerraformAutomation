resource "aws_elastictranscoder_pipeline" "transcode_video" {
  input_bucket  = var.s3_bucket_1.id
  name          = var.transcoded_video
  output_bucket = var.s3_bucket_2.id
  role          = var.iam_transcoder.arn
}


