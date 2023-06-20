variable "my-access-key" {
  sensitive = true
  type = string
  default = "AKIA3YK5LKNVXUW2XCUG"
}

variable "my-secret-key" {
  sensitive = true
  type = string
  default = "KwTcaZ/cyaIHINvvg9o3pqXbYDjWVM1Yu14rP46Z"
}

variable "eks-cluster-name" {
  sensitive = false
  type = string
  default = "eks-security"
}

variable "vpc-name" {
  sensitive = false
  type = string
  default = "eks-security"
}

variable "vpc-cidr" {
  sensitive = false
  type = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "eks-version" {
  sensitive = false
  type = string
  default = "1.27"
}

variable "user1" {
  sensitive = false
  type = string
  default = "kazama"
}

variable "aws_auth_roles_rolearn" {
  sensitive = false
  type = string
  default = "arn:aws:iam::082396398680:role/aws-service-role/eks.amazonaws.com/AWSServiceRoleForAmazonEKS"
}

