##############################################################################
# Outputs
##############################################################################

output "toolchain_id" {
  value       = ibm_cd_toolchain.toolchain_instance.id
  description = "The CD toolchain ID."
}

output "secret_tool" {
  value       = module.integrations.secret_tool
  description = "The secret tool."
}

output "secrets_manager_instance_id" {
  value       = module.services.sm_instance_guid
  description = "The Secrets Manager instance ID."
}

output "key_protect_instance_id" {
  value       = module.services.kp_instance_guid
  description = "The Key Protect instance ID."
}

output "deployment_repo_url" {
  value       = module.repositories.deployment_repo_url
  description = "The deployment repo URL."
}

output "change_management_repo_url" {
  value       = module.repositories.change_management_repo_url
  description = "The change management repo URL."
}

output "cd_pipeline_id" {
  value       = module.pipeline_cd.pipeline_id
  description = "The CD pipeline ID."
}

output "pipeline_repo_url" {
  value       = module.repositories.pipeline_repo_url
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}


##############################################################################
