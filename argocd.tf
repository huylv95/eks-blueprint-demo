
# locals {
#   environment     = "dev"
#   cluster_version = "1.29"

#   gitops_addons_url      = "https://github.com/gitops-bridge-dev/gitops-bridge-argocd-control-plane-template"
#   gitops_addons_basepath = ""
#   gitops_addons_path     = "bootstrap/control-plane/addons"
#   gitops_addons_revision = "HEAD"


#   addons = merge(local.oss_addons, { kubernetes_version = local.cluster_version })
#   oss_addons = {
#     enable_argo_workflows = true
#     enable_foo            = true # you can add any addon here, make sure to update the gitops repo with the corresponding application set
#   }

#   addons_metadata = merge(
#     {
#       addons_repo_url      = local.gitops_addons_url
#       addons_repo_basepath = local.gitops_addons_basepath
#       addons_repo_path     = local.gitops_addons_path
#       addons_repo_revision = local.gitops_addons_revision
#     }
#   )

#   #   argocd_apps = {
#   #     addons    = file("${path.module}/bootstrap/addons.yaml")
#   #     workloads = file("${path.module}/bootstrap/workloads.yaml")
#   #   }

# }

# ################################################################################
# # GitOps Bridge: Bootstrap
# ################################################################################
# module "gitops_bridge_bootstrap" {
#   source = "github.com/gitops-bridge-dev/gitops-bridge-argocd-bootstrap-terraform?ref=v2.0.0"

#   cluster = {
#     cluster_name = local.name
#     environment  = local.environment
#     #metadata     = local.addons_metadata
#     #addons       = local.addons
#   }
#   #apps = local.argocd_apps
# }
