# provider.tf
provider "aws" {
  region  = "us-east-1"
  profile = "myaws"  # AWS profile that Terraform should use (from ~/.aws/credentials)
}

