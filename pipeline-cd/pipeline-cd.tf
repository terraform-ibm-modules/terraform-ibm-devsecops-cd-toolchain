resource "ibm_cd_tekton_pipeline" "cd_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = var.worker_id
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cd_pipeline_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.pipeline_repo_url
      branch = var.pipeline_branch
      path   = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_manual_trigger" {
  pipeline_id         = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type                = "manual"
  name                = var.trigger_manual_name
  event_listener      = "cd-listener"
  enabled             = var.trigger_manual_enable
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_promotion_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type           = "manual"
  name           = var.trigger_manual_promotion_name
  event_listener = "promotion-listener"
  enabled        = var.trigger_manual_promotion_enable
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_timed_trigger" {
  pipeline_id         = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type                = "timer"
  name                = var.trigger_timed_name
  event_listener      = "cd-listener"
  enabled             = var.trigger_timed_enable
  cron                = var.trigger_timed_cron_schedule
  timezone            = "UTC"
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_scm_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  name           = var.trigger_git_name
  type           = "scm"
  event_listener = "cd-listener"
  events         = ["push"]
  source {
    type = "git"
    properties {
      url    = var.inventory_repo_url
      branch = "prod"
    }
  }
  enabled             = var.trigger_git_enable
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}
