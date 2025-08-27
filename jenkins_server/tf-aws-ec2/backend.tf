terraform {
  backend "s3" {
    bucket = "jenkins-terraform-state-42001"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}