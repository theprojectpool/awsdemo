module "ec2-iam-role" {
  source = "Smartbrood/ec2-iam-role/aws"
  name   = "ec2-iam-role"

  policy_arn = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess",
  ]
}
