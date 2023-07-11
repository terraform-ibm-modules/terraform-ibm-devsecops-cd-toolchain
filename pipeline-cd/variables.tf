variable "pipeline_id" {
}

variable "resource_group" {
}

variable "cluster_name" {
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

variable "pipeline_ibmcloud_api_key_secret_name" {
}

variable "code_signing_cert_secret_name" {
}

variable "enable_signing_validation" {
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

variable "pipeline_config_path" {
}

variable "pipeline_config_repo" {
}

variable "pipeline_branch" {
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

variable "ibmcloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint"
  default     = "https://cloud.ibm.com"
}

variable "cos_api_key_secret_name" {
}

variable "cos_bucket_name" {
}

variable "cos_endpoint" {
}

variable "doi_environment" {
}

variable "doi_toolchain_id" {
}

variable "compliance_base_image" {
}

variable "target_environment_detail" {
}

variable "customer_impact" {
}

variable "target_environment_purpose" {
}

variable "change_request_id" {
}

variable "satellite_cluster_group" {
}

variable "source_environment" {
}

variable "target_environment" {
}

variable "merge_cra_sbom" {
}

variable "opt_out_v1_evidence" {
}

variable "emergency_label" {
}

variable "app_version" {
}

variable "slack_notifications" {
}

variable "pipeline_debug" {
}

variable "enable_artifactory" {
}

variable "tool_artifactory" {
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