variable "pipeline_id" {
}

variable "resource_group" {
}

variable "cluster_namespace" {
}

variable "cluster_region" {
}

variable "region" {
}

variable "ibmcloud_api_key" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

variable "worker_id" {
  type        = string
  description = "The Private Worker Id or public"
}

variable "pipeline_ibmcloud_api_key_secret_ref" {
}

variable "pipeline_doi_api_key_secret_ref" {
}

variable "link_to_doi_toolchain" {
}

variable "code_signing_cert_secret_ref" {
}

variable "code_signing_cert" {
}

variable "deployment_repo" {
}

variable "deployment_repo_branch" {
}

variable "change_management_repo" {
}

variable "pipeline_repo_url" {
}

variable "inventory_repo_url" {
}

variable "evidence_repo_url" {
}

variable "issues_repo_url" {
}

variable "inventory_repo" {
}

variable "evidence_repo" {
}

variable "issues_repo" {
}

variable "pipeline_config_repo_existing_url" {
}

variable "pipeline_config_repo_clone_from_url" {
}

variable "pipeline_config_repo_branch" {
}

variable "pipeline_config_repo" {
}

variable "pipeline_branch" {
}

variable "pipeline_git_tag" {
}

variable "pipeline_path" {
  type        = string
  description = "The relative folder path within pipeline definitions repository containing tekton definitions for pipelines."
  default     = "definitions"
}

variable "cd_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by CD Pipeline"
  default     = 1
}

variable "cos_api_key_secret_ref" {
}

variable "cos_bucket_name" {
}

variable "cos_endpoint" {
}

variable "doi_toolchain_id" {
}

variable "enable_artifactory" {
}

variable "enable_pipeline_git_token" {
}

variable "artifact_signature_verification" {
}

variable "tool_artifactory" {
}

variable "create_triggers" {
}

variable "trigger_git_name" {
}
variable "trigger_git_enable" {
}

variable "trigger_timed_name" {
}
variable "trigger_timed_enable" {
}
variable "trigger_timed_cron_schedule" {
}

variable "trigger_manual_name" {
}
variable "trigger_manual_enable" {
}

variable "trigger_manual_promotion_name" {
}
variable "trigger_manual_promotion_enable" {
}

variable "trigger_manual_pruner_name" {
}
variable "trigger_manual_pruner_enable" {
}

variable "trigger_timed_pruner_name" {
}
variable "trigger_timed_pruner_enable" {
}

variable "enable_pipeline_notifications" {
}
variable "event_notifications" {

}

variable "trigger_git_promotion_listener" {
}

variable "trigger_git_promotion_enable" {
}

variable "trigger_git_promotion_branch" {
}

variable "trigger_git_promotion_validation_name" {
}

##### EVENT NOTIFICATIONS ################

######## Code Engine Vars #####################
variable "deployment_target" {
}

variable "code_engine_project" {
}

variable "code_engine_region" {
}
