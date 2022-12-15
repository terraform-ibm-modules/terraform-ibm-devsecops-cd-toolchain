variable "deployment_repo" {
    type        = string
    description = "This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates."
}

variable "change_management_repo" {
    type        = string
    description = "This repository holds the change management requests created for the deployments."
}

variable "pipeline_repo" {
    type        = string
    description = "This repository contains the tekton definitions for compliance pipelines."
}

variable "inventory_repo" {
    type        = string
    description = "This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates."
}

variable "evidence_repo" {
    type        = string
    description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "issues_repo" {
    type        = string
    description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "toolchain_id" {
}

variable "resource_group" {
}

variable "toolchain_region" {
}

variable "ibm_cloud_api_key" {
}

variable "toolchain_crn" {
    type        = string
    description = "The CRN of the created toolchain"
}

variable "deployment_repo_clone_from_url" {
    type        = string
    description = "(Optional) Override the default deployment app by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
    default     = ""
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

variable "deployment_repo_existing_git_provider" {
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

