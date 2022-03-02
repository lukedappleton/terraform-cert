resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}

output "combined_names" {
    value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}