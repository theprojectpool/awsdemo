resource "aws_iam_user" "Alice" {
  name = "Alice"
}

resource "aws_iam_user" "Diana" {
  name = "Diana"
}

module "assumed_roles" {
  source              = "github.com/cloudposse/terraform-aws-iam-assumed-roles.git?ref=master"
  admin_group_name    = "Admins"
  readonly_group_name = "Watchers"
}

# Alice will be in 'ops' group with 'AdministratorAcsess'
#
resource "aws_iam_group_membership" "admin" {
  name = "ops-group-membership"
  users = ["${aws_iam_user.Alice.name}"]
  group = "${module.assumed_roles.group_admin_name}"
}

# Diana will be in 'readonly' group with 'ReadOnlyAccess'
#
resource "aws_iam_group_membership" "readonly" {
  name = "ro-group-membership"
  users = ["${aws_iam_user.Diana.name}"]
  group = "${module.assumed_roles.group_readonly_name}"
}
