data "aws_iam_policy_document" "alb_doc" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]
    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ebs_policy" {
  name        = "eks-alb-policy-${var.eks_cluster}"
  path        = "/cloud-platform/"
  policy      = data.aws_iam_policy_document.alb_doc.json
  description = "Policy for ALB ingress controller"
}
