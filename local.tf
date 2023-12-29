locals {
  name   = basename(path.cwd)
  region = "ap-southeast-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  namespace = "external-secrets"

  cluster_secretstore_name = "cluster-secretstore-sm"
  secretstore_name         = "secretstore-ps"

  cluster_secretstore_sa = "cluster-secretstore-sa"
  secretstore_sa         = "secretstore-sa"

  tags = {
    Blueprint  = local.name
    GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
  }
}