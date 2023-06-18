module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.eks-cluster-name
  cluster_version = var.eks-version

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.private_subnets

  # Fargate Profile(s)
  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "*"
        }
      ]
    }
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = var.aws_auth_roles_rolearn
      username = "AWSServiceRoleForAmazonEKS"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = aws_iam_user.user.arn
      username = aws_iam_user.user.id
      groups   = ["system:masters"]
    }
  ]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
  depends_on = [ module.vpc ]
}