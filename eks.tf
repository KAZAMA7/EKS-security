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
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets

# EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t2.medium", "t2.micro", "t3.medium", "t3.micro" ]
  }

  eks_managed_node_groups = {

    green = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }


  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
  depends_on = [ module.vpc ]
}