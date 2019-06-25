variable "number_of_subnets" {
  type    = "string"
  description = "Number of subnets to create"
  default = "2"
}

variable number_of_routes_tables {
  default = "2"
  type = "String"
  description = "AWS AZs (Availability zones) where subnets should be created"
}

variable "cluster_name" {
  type    = "string"
  description = "Name to give the cluster"
}

variable "availability_zones" {
  type = "list"
  description = "List of az's to create the work node subets in"
}

variable vpc_cidr {
  default = "10.0.0.0/16"
  type = "string"
  description = "CIDR of the VPC"
}

