terraform {
  required_version = ">= 1.4.0"
  backend "remote" {
    organization = "my_web3_projects"

    workspaces {
      name = "blockchain-node-terraform"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
