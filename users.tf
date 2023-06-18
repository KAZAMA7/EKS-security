resource "aws_iam_user" "user" {
  name = var.user1
  tags = {
    tag-key = "terraform"
  }
}