#---------------------------------------------------------------
# CREATE EFS
#---------------------------------------------------------------
module "efs" {
  source  = "cloudposse/efs/aws"
  version = "0.35.0"
  # insert the 3 required variables here

  region  = local.region
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets


  additional_security_group_rules = [
    {
      type        = "ingress"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow ingress traffic to EFS from trusted Security Groups"
    }
  ]

}