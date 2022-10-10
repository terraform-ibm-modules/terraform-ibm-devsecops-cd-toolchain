resource "ibm_cd_tekton_pipeline" "cd_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cd_pipeline_definition" {
  pipeline_id   = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  scm_source {
    url         = var.pipeline_repo
    branch      = var.pipeline_branch
    path        = var.pipeline_path
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_manual_trigger" {
  pipeline_id       = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type            = var.cd_pipeline_manual_trigger_type
  name            = var.cd_pipeline_manual_trigger_name
  event_listener  = var.cd_pipeline_manual_trigger_listener_name
  disabled        = var.cd_pipeline_manual_trigger_disabled
  max_concurrent_runs = var.cd_pipeline_max_concurrent_runs

}

resource "ibm_cd_tekton_pipeline_trigger" "cd_pipeline_promotion_trigger" {
  pipeline_id       = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  type            = var.cd_pipeline_promotion_trigger_type
  name            = var.cd_pipeline_promotion_trigger_name
  event_listener  = var.cd_pipeline_promotion_trigger_listener_name
  disabled        = var.cd_pipeline_promotion_trigger_disabled
  
}

