terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "3-tier/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

