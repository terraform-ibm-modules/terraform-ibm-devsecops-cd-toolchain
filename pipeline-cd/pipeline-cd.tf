resource "ibm_cd_tekton_pipeline" "cd_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = var.worker_id
  }
  enable_notifications = var.enable_pipeline_notifications
}

resource "ibm_cd_tekton_pipeline_definition" "cd_pipeline_definition" {
  count       = ((var.pipeline_git_tag == "") && (var.add_pipeline_definitions)) ? 1 : 0
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

resource "ibm_cd_tekton_pipeline_definition" "cd_tekton_definition_tag" {
  count       = ((var.pipeline_git_tag != "") && (var.add_pipeline_definitions)) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      tag  = var.pipeline_git_tag
      path = var.pipeline_path
      url  = var.pipeline_repo_url
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_manual_trigger" {
  count               = (var.create_triggers) ? 1 : 0
  pipeline_id         = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type                = "manual"
  name                = var.trigger_manual_name
  event_listener      = "cd-listener"
  enabled             = var.trigger_manual_enable
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_promotion_trigger" {
  count          = (var.create_triggers) ? 1 : 0
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type           = "manual"
  name           = var.trigger_manual_promotion_name
  event_listener = "promotion-listener"
  enabled        = var.trigger_manual_promotion_enable
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_timed_trigger" {
  count               = (var.create_triggers) ? 1 : 0
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
  count          = (var.create_git_triggers) ? 1 : 0
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

# git promotion validation listener
resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_git_promotion_validation" {
  count          = (var.create_git_triggers) ? 1 : 0
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type           = "scm"
  name           = var.trigger_git_promotion_validation_name
  event_listener = var.trigger_git_promotion_listener
  enabled        = var.trigger_git_promotion_enable
  source {
    type = "git"
    properties {
      url    = var.inventory_repo_url
      branch = var.trigger_git_promotion_branch
    }
  }
  events = ["pull_request"]
}
