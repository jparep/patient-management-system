terraform {
  backend "s3" {
    bucket         = "terraform-state-patient-management"
    key            = "state/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
