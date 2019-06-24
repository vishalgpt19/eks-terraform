
variable "cluster_name" {
  type = "string"
  description = "Name to give the cluster"
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

variable "k8s-version" {
  default     = "1.11"
  type        = "string"
  description = "Required K8s version"
}

variable "number_of_nodes" {
  default = 2
  type    = "string"
  description = "Number of work nodes to create"
}

variable "max-size" {
  default     = 5
  type        = "string"
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = "string"
  description = "Autoscaling Minimum node capacity"
}

