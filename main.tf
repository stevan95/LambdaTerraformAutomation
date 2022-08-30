provider "aws" {
  region     = var.aws-region
}

module "sns" {
    source = "./modules/sns"

    s3_bucket_2 = module.s3Bucket.s3_bucket_2
}

module "lambda" {
    source = "./modules/lambda"

    s3_bucket_1 = module.s3Bucket.s3_bucket_1 
    iam_lambda = module.iamRoles.iam_lambda
}

module "elastictranscoder" {
    source = "./modules/elastictranscoder"

    s3_bucket_1 = module.s3Bucket.s3_bucket_1 
    s3_bucket_2 = module.s3Bucket.s3_bucket_2
    iam_transcoder = module.iamRoles.iam_transcoder

    
}

module "iamRoles" {
    source = "./modules/iamRoles"
}

module "s3Bucket" {
    source = "./modules/s3Bucket"
}