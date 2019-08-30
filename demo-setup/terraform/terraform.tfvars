/*
 * Copyright 2019 Google LLC. This software is provided as-is, without warranty
 * or representation for any use or purpose. Your use of it is subject to your 
 * agreement with Google.  
 */

gcp_credentials_path = "/path/to/the/key/file.json"
gcs_remote_state = "apszaz-cloudbuild-demo-rs"
pipeline_project = "apszaz-cloudbuild-demo"
source_repo = "git@github.com:apsureda/cloudbuild-demo"
git_user_email = "noreply@mycompany.com"
pipeline_project_services = [
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudbuild.googleapis.com",
    "containerregistry.googleapis.com",
    "sourcerepo.googleapis.com",
]