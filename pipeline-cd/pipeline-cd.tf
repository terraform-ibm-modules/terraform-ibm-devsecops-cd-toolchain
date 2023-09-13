resource "ibm_cd_tekton_pipeline" "cd_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = var.worker_id
  }
  enable_notifications = var.enable_pipeline_notifications
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

############ Pruner Triggers   #############################
resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_manual_pruner_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type           = "manual"
  name           = var.trigger_manual_pruner_name
  event_listener = "prune-evidence-listener"
  enabled        = var.trigger_manual_pruner_enable #true
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_manual_pruner_trigger_property_batch" {
  name        = "evidence-pruner-batch-size"
  type        = "text"
  value       = "1000"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_manual_pruner_trigger_property_branch" {
  name        = "evidence-pruner-branch"
  type        = "text"
  value       = "chore/prune-evidences"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_manual_pruner_trigger_property_retention" {
  name        = "evidence-retention-days"
  type        = "text"
  value       = ""
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_manual_pruner_trigger_property_v1" {
  name        = "opt-in-v1-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_manual_pruner_trigger_property_v2" {
  name        = "opt-in-v2-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_timed_pruner_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type           = "timer"
  name           = var.trigger_timed_pruner_name
  event_listener = "prune-evidence-listener"
  cron           = "0 2 * * *"
  timezone       = "UTC"
  enabled        = var.trigger_timed_pruner_enable #false
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_timed_pruner_trigger_property_batch" {
  name        = "evidence-pruner-batch-size"
  type        = "text"
  value       = "1000"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_timed_pruner_trigger_property_branch" {
  name        = "evidence-pruner-branch"
  type        = "text"
  value       = "chore/prune-evidences"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_timed_pruner_trigger_property_retention" {
  name        = "evidence-retention-days"
  type        = "text"
  value       = "365"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_timed_pruner_trigger_property_v1" {
  name        = "opt-in-v1-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "cd_pipeline_timed_pruner_trigger_property_v2" {
  name        = "opt-in-v2-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.cd_pipeline_timed_pruner_trigger.trigger_id
}
