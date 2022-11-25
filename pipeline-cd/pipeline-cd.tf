resource "ibm_cd_tekton_pipeline" "cd_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cd_pipeline_definition" {
  pipeline_id   = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url         = var.pipeline_repo
      branch      = var.pipeline_branch
      path        = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_manual_trigger" {
  pipeline_id       = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type            = "manual"
  name            = "Manual CD Trigger"
  event_listener  = "cd-listener"
  enabled        = "true"
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_promotion_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type           = "manual"
  name           = "Manual Promotion Trigger"
  event_listener = "promotion-listener"
  enabled        = "true"
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_timed_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type           = "timer"
  name           = "Git CD Timed Trigger"
  event_listener = "cd-listener"
  enabled        = "false"
  cron           = "0 4 * * *"
  timezone       = "UTC"
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_scm_trigger" {
  pipeline_id     = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  name            = "Git CD Trigger"
  type            = "scm"
  event_listener  = "cd-listener"
  events = ["push"]
  source {
    type = "git"
    properties {
      url     = var.inventory_repo
      branch  = "prod"
    }
  }
  enabled         = "false"
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs
}