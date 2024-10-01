resource "aws_s3_bucket" "s3_data_bucket" {
  bucket = "rh-ecs-test-bucket"
 
}


resource "aws_iam_policy" "s3_policy" {
  name   = "ecs-s3-policy"
  policy = "${data.aws_iam_policy_document.s3_data_bucket_policy.json}"
}

data "aws_iam_policy_document" "s3_data_bucket_policy" {
  statement {
    sid = ""
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_data_bucket.bucket}"
    ]
  }
  statement {
    sid = ""
    effect = "Allow"
    actions = [
      "s3:DeleteObject",
      "s3:GetObject",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.s3_data_bucket.bucket}/*"
    ]
  }
}
