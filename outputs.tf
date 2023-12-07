output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = "aws eks --region ${local.region} update-kubeconfig --name ${module.eks.cluster_name}"
}


output "test_secret" {
  description = "test pod show secret"
  value       = "kubectl exec busybox -- env"
}

output "test_ebs" {
  description = "test pod show ebs"
  value       = "kubectl exec pod/ebs-pod-gp3 -- df -h /data"
}

output "test_efs" {
  description = "test pod show ebs"
  value       = "kubectl exec pod/efs-pod -- df -h /efs"
}
