variable "eks_cluster" {
  type        = string
  description = "cluster name"
}

variable "namespace" {
  type    = string
  default = "ingress-controllers"
}
