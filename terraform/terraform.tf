terraform {
  required_version = ">= 1.4.0"
  backend "remote" {
    hostname     = "app.terraform.io"
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
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}
