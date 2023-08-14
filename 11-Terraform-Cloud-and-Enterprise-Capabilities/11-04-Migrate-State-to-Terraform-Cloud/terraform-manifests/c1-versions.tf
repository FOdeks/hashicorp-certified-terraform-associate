# Terraform Block
terraform {
  required_version = ">= 1.5" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Update remote backend information
terraform {
  cloud {
    organization = "fandf"

    workspaces {
      name = "state-migration-demo"
    }
  }
}

# Two cases: 
# Case-1: If workspace already exists, it should not have any state files in states tab
# Case-2: If workspace does not exist during migration, it will get created

# Provider Block
provider "aws" {
  region  = var.aws_region
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
