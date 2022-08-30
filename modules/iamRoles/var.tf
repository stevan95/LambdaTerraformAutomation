variable "iam_policy_arn" {
  description = "IAM Policy to be attached to role"
  type = list
  default = ["arn:aws:iam::aws:policy/AWSLambdaExecute", "arn:aws:iam::aws:policy/AmazonElasticTranscoder_JobsSubmitter", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]
}