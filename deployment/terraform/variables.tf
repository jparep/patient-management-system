# Variables for VPC
variable "vpc_name" {
  description = "The name of the VPC"
  default     = "patient-management-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones for the subnets"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "public_subnets" {
  description = "Public subnets CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  description = "Private subnets CIDR blocks"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# Variables for EKS
variable "cluster_name" {
  description = "EKS cluster name"
  default     = "patient-management-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  default     = "1.25"
}

# Variables for Node Group
variable "node_desired_capacity" {
  description = "Desired number of nodes in the node group"
  default     = 2
}

variable "node_max_capacity" {
  description = "Maximum number of nodes in the node group"
  default     = 5
}

variable "node_min_capacity" {
  description = "Minimum number of nodes in the node group"
  default     = 1
}

variable "node_instance_type" {
  description = "Instance type for the nodes"
  default     = "t3.medium"
}

# Variables for Kubernetes Namespace
variable "namespace" {
  description = "Namespace for the application"
  default     = "patient-management"
}
