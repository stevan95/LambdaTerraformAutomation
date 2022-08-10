variable "aws-region" {
    type = string 
    default = "us-east-1"
}

variable "s3_bucket_1" {
  type = string
  default = "serverless-video-upload-test01-atlas"
}

variable "s3_bucket_2" {
  type = string
  default = "serverless-video-transcoded-test01-atlas"
}

variable "iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type = list
  default = ["arn:aws:iam::aws:policy/AWSLambdaExecute", "arn:aws:iam::aws:policy/AmazonElasticTranscoder_JobsSubmitter", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}

