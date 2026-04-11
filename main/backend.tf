terraform {
  backend "s3" {
    bucket         = "hstf-state-bucket"
    key            = "terraform/state.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
