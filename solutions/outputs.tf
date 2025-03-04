##############################################################################
# Outputs
##############################################################################

output "toolchain_id" {
  value       = module.devsecops_cd_toolchain.toolchain_id
  description = "The CD toolchain ID."
}

output "secret_tool" {
  value       = module.devsecops_cd_toolchain.secret_tool
  description = "The secret tool."
}

output "secret_tool_v1" {
  value       = module.devsecops_cd_toolchain.secret_tool_v1
  description = "The legacy secret tool. Used as part of secret references to point to the secret tool integration. This is the legacy version of the secrets tool. The new version was updated to support using different secret groups with Secrests Manager. This only effects Secrets Manager. The net difference is that the legacy secret tool returns the tool name and the secret group name whereas the new tool returns only the tool name."
}

output "secrets_manager_instance_id" {
  value       = module.devsecops_cd_toolchain.secrets_manager_instance_id
  description = "The Secrets Manager instance ID."
}

output "deployment_repo" {
  value       = module.devsecops_cd_toolchain.deployment_repo
  description = "The Deployment repo."
  sensitive   = true
}

output "deployment_repo_git_provider" {
  value       = module.devsecops_cd_toolchain.deployment_repo_git_provider
  description = "The deployment repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "deployment_repo_git_id" {
  value       = module.devsecops_cd_toolchain.deployment_repo_git_id
  description = "The deployment repository Git ID"
}

output "deployment_repo_url" {
  value       = module.devsecops_cd_toolchain.deployment_repo_url
  description = "The deployment repo URL."
}

output "cd_pipeline_id" {
  value       = module.devsecops_cd_toolchain.cd_pipeline_id
  description = "The CD pipeline ID."
}

output "issues_repo" {
  value       = module.devsecops_cd_toolchain.issues_repo
  description = "The Issues repo."
  sensitive   = true
}

output "issues_repo_git_provider" {
  value       = module.devsecops_cd_toolchain.issues_repo_git_provider
  description = "The issues repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "issues_repo_git_id" {
  value       = module.devsecops_cd_toolchain.issues_repo_git_id
  description = "The issues repository Git ID"
}

output "issues_repo_url" {
  value       = module.devsecops_cd_toolchain.issues_repo_url
  description = "The incident issues repository instance URL, where issues are created when vulnerabilities and CVEs are detected."
}

output "inventory_repo" {
  value       = module.devsecops_cd_toolchain.inventory_repo
  description = "The Inventory repo."
  sensitive   = true
}

output "inventory_repo_git_provider" {
  value       = module.devsecops_cd_toolchain.inventory_repo_git_provider
  description = "The inventory repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "inventory_repo_git_id" {
  value       = module.devsecops_cd_toolchain.inventory_repo_git_id
  description = "The inventory repository Git ID"
}

output "inventory_repo_url" {
  value       = module.devsecops_cd_toolchain.inventory_repo_url
  description = "The inventory repository instance URL, with details of which artifact has been built and will be deployed."
}

output "evidence_repo" {
  value       = module.devsecops_cd_toolchain.evidence_repo
  description = "The Evidence repo."
  sensitive   = true
}

output "evidence_repo_git_provider" {
  value       = module.devsecops_cd_toolchain.evidence_repo_git_provider
  description = "The evidence repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "evidence_repo_git_id" {
  value       = module.devsecops_cd_toolchain.evidence_repo_git_id
  description = "The evidence repository Git ID"
}

output "evidence_repo_url" {
  value       = module.devsecops_cd_toolchain.evidence_repo_url
  description = "The evidence repository instance URL, where evidence of the builds and scans are stored, ready for any compliance audit."
}

output "change_management_repo_git_provider" {
  value       = module.devsecops_cd_toolchain.change_management_repo_git_provider
  description = "The issues repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "change_management_repo_git_id" {
  value       = module.devsecops_cd_toolchain.change_management_repo_git_id
  description = "The issues repository Git ID"
}

output "change_management_repo_url" {
  value       = module.devsecops_cd_toolchain.change_management_repo_url
  description = "The change management repository instance URL."
}

output "change_management_repo" {
  value       = module.devsecops_cd_toolchain.change_management_repo
  description = "The Change Management repository."
  sensitive   = true
}

output "pipeline_config_repo_url" {
  value       = module.devsecops_cd_toolchain.pipeline_config_repo_url
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}

output "pipeline_config_repo_git_provider" {
  value       = module.devsecops_cd_toolchain.pipeline_config_repo_git_provider
  description = "The compliance pipeline repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "pipeline_config_repo_git_id" {
  value       = module.devsecops_cd_toolchain.pipeline_config_repo_git_id
  description = "The compliance pipeline repository Git ID"
}

output "pipeline_repo_url" {
  value       = module.devsecops_cd_toolchain.pipeline_repo_url
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}

output "toolchain_url" {
  value       = module.devsecops_cd_toolchain.toolchain_url
  description = "The CD toolchain URL."
}

##############################################################################
