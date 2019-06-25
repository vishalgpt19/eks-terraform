#
# Not required: currently used in conjuction with using
# icanhazip.com to determine local workstation external IP
# to open EC2 Security Group access to the Kubernetes cluster.
# See workstation-ip.tf for additional information.
#

provider "aws" {
  region = "${var.aws-region}"
}

provider "http" {}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {}
#
# The terraform kubernetes provider does not support the 'exec' authentication provider.
# The exec provider is required for aws, using heptio's authenticato, to retrieve a valid token.
# The authenticator.sh script grabs a token using heptio for the currently aws authenticated user.
# This enables the k8s configuration for the workers to be created and enable the workers to join 
# the cluster in a single terraform apply.
# https://github.com/terraform-providers/terraform-provider-kubernetes/issues/161
