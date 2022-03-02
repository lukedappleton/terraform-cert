variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "elb_names" {
    type = list
    default = ["dev-loadbalancer", "stage-loadbalancer", "prod-loadbalancer"]
}

variable "sg_ports" {
  type = list(number)
  description = "list of ingress ports"
  default = [8200, 8201, 8300, 9200, 9500]
}
