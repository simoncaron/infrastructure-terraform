terraform {
  backend "s3" {
    bucket                      = "tfstate-infrastructure"
    key                         = "terraform.tfstate"
    region                      = "us-east-1"
    endpoint                    = "s3.simn.io"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}