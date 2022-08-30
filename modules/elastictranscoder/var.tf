variable "s3_bucket_1" {
    type = any
}

variable "s3_bucket_2" {
    type = any
}

variable "iam_transcoder" {
    type = any
}

variable "transcoded_video" {
  type = string
  default = "serverless-video-transcoded-atlas"
}