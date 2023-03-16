terraform {
  backend "s3" {
    bucket = "terraform-statefile-12"
    key    = "statefiles/terraform.tfstate"
    region = "us-east-1"
  }
}
