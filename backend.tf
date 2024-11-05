terraform {
  backend "s3" {
    bucket = "github-actions-terraform987654321"
    key    = "github-actions-tfstate"
    region = "us-east-1"
  }
}
