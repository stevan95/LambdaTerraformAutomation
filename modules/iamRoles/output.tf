output "iam_transcoder" {
  value = aws_iam_role.video_transcode_role
}

output "iam_lambda" {
  value = aws_iam_role.lambda_role
}