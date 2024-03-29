
variable "cluster_name" {
  type = "string"
  description = "Name to give the cluster"
}

variable "aws-region" {
  default     = "eu-west-1"
  type        = "string"
  description = "The AWS Region to deploy EKS"
}

variable "availability_zones" {
  type = "list"
  description = "List of az's to create the work node subets in"
}

variable "node_instance_type" {
  default = "t2.medium"
  type = "string"
  description = "The aws instance type for the work nodes"
}

variable "number_of_nodes" {
  default = 2
  type    = "string"
  description = "Number of work nodes to create"
}

variable "max_size" {
  default     = 5
  type        = "string"
  description = "Autoscaling maximum node capacity"
}

variable "min_size" {
  default     = 1
  type        = "string"
  description = "Autoscaling Minimum node capacity"
}

variable vpc_cidr {
  default = "10.0.0.0/16"
  type = "string"
  description = "CIDR of the VPC"
}

