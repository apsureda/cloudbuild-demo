/*
 * Copyright 2019 Google LLC. This software is provided as-is, without warranty
 * or representation for any use or purpose. Your use of it is subject to your 
 * agreement with Google.  
 */
provider "google" {
  #   credentials = "${file(var.gcp_credentials_path)}"
  version = "~> 2.5.0"
}

terraform {
  backend "gcs" {
    bucket = "apszaz-cloudbuild-demo-rs"
    prefix = "hec/demo-pipeline"
  }
}
