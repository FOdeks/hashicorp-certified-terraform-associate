# Terraform Block
terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Update backend information as Terraform Clo
terraform {
  cloud {
    organization = "FandF"

    workspaces {
      name = "sentinel-demo1"
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
