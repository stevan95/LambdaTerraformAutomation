resource "aws_elastictranscoder_pipeline" "transcode_video" {
  input_bucket  = "${aws_s3_bucket.transcoder-bucket_1.bucket}"
  name          = var.transcoded_video
  output_bucket = "${aws_s3_bucket.transcoder-bucket_2.bucket}"
  role          = aws_iam_role.video_transcode_role.arn
}


