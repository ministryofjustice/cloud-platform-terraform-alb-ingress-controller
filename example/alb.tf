module "alb" {
  source = "../"
  # "github.com/ministryofjustice/cloud-platform-terraform-alb-ingress-controller?ref=1.0.0"
  eks_cluster = "alb-test"
}
