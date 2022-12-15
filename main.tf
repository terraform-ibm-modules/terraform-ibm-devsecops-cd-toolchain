data "ibm_resource_group" "resource_group" {
  name = var.toolchain_resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name        = var.toolchain_name
  description = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source                                 = "./repositories"
  toolchain_id                           = ibm_cd_toolchain.toolchain_instance.id
  toolchain_crn                          = ibm_cd_toolchain.toolchain_instance.crn
  resource_group                         = data.ibm_resource_group.resource_group.id
  ibm_cloud_api_key                      = var.ibm_cloud_api_key
  toolchain_region                       = var.toolchain_region
  deployment_repo                        = var.deployment_repo
  change_management_repo                 = var.change_management_repo
  pipeline_repo                          = var.pipeline_repo
  evidence_repo                          = var.evidence_repo
  inventory_repo                         = var.inventory_repo
  issues_repo                            = var.issues_repo
  change_repo_clone_from_url             = var.change_repo_clone_from_url
  deployment_repo_clone_from_url         = var.deployment_repo_clone_from_url
  deployment_repo_clone_from_branch      = var.deployment_repo_clone_from_branch
  deployment_repo_existing_git_provider  = var.deployment_repo_existing_git_provider
  deployment_repo_existing_git_id        = var.deployment_repo_existing_git_id
  deployment_repo_clone_to_git_provider  = var.deployment_repo_clone_to_git_provider
  deployment_repo_clone_to_git_id        = var.deployment_repo_clone_to_git_id
  deployment_repo_existing_url           = var.deployment_repo_existing_url
  deployment_repo_existing_branch        = var.deployment_repo_existing_branch
  repositories_prefix                    = var.repositories_prefix
}

resource "ibm_cd_toolchain_tool_pipeline" "cd_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "cd-pipeline"
  }
}

module "pipeline-cd" {
  source                    = "./pipeline-cd"
  depends_on                = [ module.repositories, module.integrations, module.services ]
  ibm_cloud_api             = var.ibm_cloud_api
  ibm_cloud_api_key         = var.ibm_cloud_api_key
  region                    = var.toolchain_region
  pipeline_id               = split("/", ibm_cd_toolchain_tool_pipeline.cd_pipeline.id)[1]
  resource_group            = var.toolchain_resource_group
  cluster_name              = var.cluster_name
  cluster_namespace         = var.cluster_namespace
  cluster_region            = var.cluster_region
  registry_namespace        = var.registry_namespace
  registry_region           = var.registry_region
  change_management_repo    = module.repositories.change_management_repo_url
  deployment_repo           = module.repositories.deployment_repo_url
  pipeline_repo             = module.repositories.pipeline_repo_url
  evidence_repo             = module.repositories.evidence_repo_url
  inventory_repo            = module.repositories.inventory_repo_url
  issues_repo               = module.repositories.issues_repo_url
  sm_integration_name       = module.integrations.secretsmanager_integration_name
  sm_group                  = var.sm_group
  cos_bucket_name           = var.cos_bucket_name
  cos_api_key               = var.cos_api_key
  cos_endpoint              = var.cos_endpoint
}

module "integrations" {
  source                    = "./integrations"
  depends_on                = [ module.repositories, module.services ]
  region                    = var.sm_region
  ibm_cloud_api_key         = var.ibm_cloud_api_key
  toolchain_id              = ibm_cd_toolchain.toolchain_instance.id
  resource_group            = var.toolchain_resource_group
  secrets_manager_instance_name = module.services.secrets_manager_instance_name
  secrets_manager_instance_guid = module.services.secrets_manager_instance_guid
  slack_channel_name        = var.slack_channel_name
  slack_api_token           = var.slack_api_token
  slack_user_name           = var.slack_user_name
  scc_evidence_repo         = module.repositories.evidence_repo_url
  scc_profile               = var.scc_profile
  scc_scope                 = var.scc_scope
  sm_location               = var.sm_region
  sm_resource_group         = var.sm_resource_group
}

module "services" {
  source                    = "./services"
  sm_name                   = var.sm_name
  sm_location               = var.sm_region
  region                    = var.toolchain_region
  ibm_cloud_api             = var.ibm_cloud_api
  cluster_name              = var.cluster_name
  cluster_namespace         = var.cluster_namespace
  cluster_region            = var.cluster_region
  registry_namespace        = var.registry_namespace
  registry_region           = var.registry_region
  sm_resource_group         = var.sm_resource_group
}

output "toolchain_id" {
  value = ibm_cd_toolchain.toolchain_instance.id
}

output "secrets_manager_instance_id" {
  value = module.services.secrets_manager_instance_guid
}

output "deployment_repo_url" {
  value = module.repositories.deployment_repo_url
}

output "change_management_repo_url" {
  value = module.repositories.change_management_repo_url
}