resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}

output "arns" {
    value = aws_iam_user.lb[*].arn
}