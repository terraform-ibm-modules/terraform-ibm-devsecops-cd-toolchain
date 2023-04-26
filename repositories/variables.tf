variable "deployment_repo_url" {
  type        = string
  description = "This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates."
}

variable "change_management_repo" {
}

variable "inventory_repo_url" {
}

variable "evidence_repo_url" {
}

variable "issues_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "toolchain_id" {
}

variable "resource_group" {
}

variable "toolchain_region" {
}

variable "ibmcloud_api_key" {
}

variable "toolchain_crn" {
  type        = string
  description = "The CRN of the created toolchain"
}

variable "deployment_repo_clone_from_url" {
}

variable "deployment_repo_clone_from_branch" {
  type        = string
  description = "Used when deployment_repo_clone_from_url is provided, the default branch that will be used by the CD build, usually either main or master."
  default     = ""
}
variable "change_repo_clone_from_url" {
  type        = string
  description = "(Optional) Override the default change management repo by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
  default     = ""
}

variable "repositories_prefix" {
}

variable "default_git_provider" {
}
variable "change_management_repo_git_provider" {
}
variable "deployment_repo_existing_git_provider" {
}

variable "pipeline_config_repo_git_provider" {
}
variable "inventory_repo_git_provider" {
}
variable "evidence_repo_git_provider" {
}
variable "issues_repo_git_provider" {
}
variable "compliance_pipeline_repo_git_provider" {
}
variable "deployment_repo_existing_git_id" {
}
variable "deployment_repo_clone_to_git_provider" {
}
variable "deployment_repo_clone_to_git_id" {
}
variable "deployment_repo_existing_url" {
}
variable "deployment_repo_existing_branch" {
}

variable "deployment_group" {
}

variable "change_management_group" {
}

variable "pipeline_config_repo_existing_url" {
}

variable "pipeline_config_repo_clone_from_url" {
}

variable "pipeline_config_repo_branch" {
}

variable "inventory_repo_auth_type" {
}

variable "issues_repo_auth_type" {
}

variable "evidence_repo_auth_type" {
}

variable "pipeline_config_repo_auth_type" {
}

variable "deployment_repo_auth_type" {
}

variable "compliance_pipeline_repo_auth_type" {
}

variable "change_management_repo_auth_type" {
}

variable "inventory_repo_git_token_secret_name" {
}

variable "issues_repo_git_token_secret_name" {
}

variable "evidence_repo_git_token_secret_name" {
}

variable "pipeline_config_repo_git_token_secret_name" {
}

variable "deployment_repo_git_token_secret_name" {
}

variable "compliance_pipeline_repo_git_token_secret_name" {
}

variable "change_management_repo_git_token_secret_name" {
}

variable "issues_group" {
}

variable "inventory_group" {
}

variable "evidence_group" {
}

variable "pipeline_config_group" {
}

variable "compliance_pipeline_group" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}
