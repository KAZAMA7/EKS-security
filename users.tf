resource "aws_iam_user" "user" {
  name = var.user1
  tags = {
    tag-key = "terraform"
  }
}

resource "aws_iam_role" "role" {
  name = var.user1

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = var.user1
  description = "Admin Policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "attach" {
  name       = var.user1
  users      = [aws_iam_user.user.name]
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}
