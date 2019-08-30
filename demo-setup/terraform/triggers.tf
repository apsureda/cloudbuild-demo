resource "google_cloudbuild_trigger" "tf_apply" {
  trigger_template {
    branch_name = "master"
    repo_name   = "${local.repo_id}"
  }

  project        = "${var.pipeline_project}"
  description    = "apply changes in production"
  filename       = "cloudbuild_tf_apply.yaml"
  included_files = ["tf_plan.enc"]

  depends_on = ["google_project_service.project"]
}

resource "google_cloudbuild_trigger" "tf_plan" {
  trigger_template {
    branch_name = "request-.*"
    repo_name   = "${local.repo_id}"
  }

  substitutions = {
    _GIT_REPO = "${var.source_repo}"
    _GIT_USER = "${var.git_user_name}"
    _GIT_MAIL = "${var.git_user_email}"
  }

  project        = "${var.pipeline_project}"
  description    = "run terraform plan, and push the output to the source repo in the request branch"
  filename       = "cloudbuild_tf_plan.yaml"
  included_files = ["terraform/*"]

  depends_on = ["google_project_service.project"]
}

locals {
  pattern    = "/^git\\@github\\.com\\:([^/]+)\\/(.+)$/"
  gh_account = "${replace(var.source_repo, local.pattern, "$1")}"
  gh_repo    = "${replace(var.source_repo, local.pattern, "$2")}"
  repo_id    = "github_${local.gh_account}_${local.gh_repo}"
}
