############################
# MAIN TERRAFORM ENTRYPOINT
############################

# This file doesn't need many resources.
# It just loads all other .tf files in this folder automatically.

terraform {
  required_version = ">= 1.2.0"
}

# Provider block is already in providers.tf
# Variables are in variables.tf
# VPC, Subnets, SG, Routes are in their respective files.

# You can leave this file empty,
# or add future configuration like remote backend.

