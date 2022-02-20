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

resource "aws_iam_policy" "alb_policy" {
  name        = "eks-alb-policy-${var.eks_cluster}"
  path        = "/cloud-platform/"
  policy      = data.aws_iam_policy_document.alb_doc.json
  description = "Policy for ALB ingress controller"
}

module "alb_irsa" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-irsa?ref=1.0.3"

  eks_cluster      = var.eks_cluster
  namespace        = var.namespace
  service_account  = "alb-ingress-controller-sa"
  role_policy_arns = [aws_iam_policy.alb_policy.arn]
}
