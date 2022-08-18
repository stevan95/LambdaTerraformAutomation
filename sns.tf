resource "aws_sns_topic" "topic" {
  name = "transcoded-video-notifications-atlas01"

  policy = <<POLICY
  {
      "Version":"2012-10-17",
      "Statement":[{
          "Effect": "Allow",
          "Principal": {"Service":"s3.amazonaws.com"},
          "Action": "SNS:Publish",
          "Resource":  "arn:aws:sns:${var.aws-region}:022865527167:transcoded-video-notifications-atlas01",
          "Condition":{
              "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.transcoder-bucket_2.arn}"}
          }
      }]
  }
  POLICY
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = "mstevan95@gmail.com"
}

resource "aws_s3_bucket_notification" "s3_notif" {
  bucket = "${aws_s3_bucket.transcoder-bucket_2.id}"
  topic {
    topic_arn = "${aws_sns_topic.topic.arn}"
    events = [
      "s3:ObjectCreated:*",
    ]
  }
}