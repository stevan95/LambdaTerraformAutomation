resource "aws_iam_role" "video_transcode_role" {
  name = "video_transcode-test01-atlas"
  description = "AWS role for VideoTranscoder"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "elastictranscoder.amazonaws.com"
        }
      },
    ]
  })
}

data "template_file" "video_transcoder" {
  template = "${file("${path.module}/policies/video_transcoder.json")}"
}

resource "aws_iam_policy" "transcoder_video_policy" {
  name        = "transcoder-video-access"
  description = "Policy for transcoder"
  policy = "${data.template_file.video_transcoder.rendered}"
} 

resource "aws_iam_role_policy_attachment" "transcoder_role_attach" {
  role       = aws_iam_role.video_transcode_role.name
  policy_arn = aws_iam_policy.transcoder_video_policy.arn
}