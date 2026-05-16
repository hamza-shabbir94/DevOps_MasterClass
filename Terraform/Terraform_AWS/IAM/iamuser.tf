# tf file for creating IAM user and attaching policy to it
resource "aws_iam_user" "admin_user1" {
  name = "admin_user1"
}

resource "aws_iam_user" "admin_user2" {
  name = "admin_user2"
}

# group for admin users
resource "aws_iam_group" "admin_group" {
  name = "admin_group"
}

# assign user to AWS group
resource "aws_iam_group_membership" "admin-users" {
  name = "admin-users"
  users = [aws_iam_user.admin_user1.name, aws_iam_user.admin_user2.name]
  group = aws_iam_group.admin_group.name
}

# attach policy to group
# If are giving access to all the services, then we can use AWS managed policy "AdministratorAccess"
# then do not delete with terraform destroy, because it is AWS managed policy and it will be used by other users as well
resource "aws_iam_group_policy_attachment" "admin_group_policy" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

