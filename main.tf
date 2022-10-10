data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name        = var.toolchain_name
  description = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source                          = "./repositories"
  toolchain_id                    = ibm_cd_toolchain.toolchain_instance.id
  resource_group                  = data.ibm_resource_group.resource_group.id  
  ibm_cloud_api_key               = var.ibm_cloud_api_key
  region                          = var.region  
  deployment_repo                 = var.deployment_repo
  change_management_repo          = var.change_management_repo
  pipeline_repo                   = var.pipeline_repo
  evidence_repo                   = var.evidence_repo
  inventory_repo                  = var.inventory_repo
  issues_repo                     = var.issues_repo
}

resource "ibm_cd_toolchain_tool_pipeline" "cd_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "cd-pipeline"
    type = "tekton"
  }
}

module "pipeline-cd" {
  source                    = "./pipeline-cd"
  depends_on                = [ module.repositories, module.integrations, module.services ]
  ibm_cloud_api             = var.ibm_cloud_api
  ibm_cloud_api_key         = var.ibm_cloud_api_key
  region                    = var.region
  pipeline_id               = split("/", ibm_cd_toolchain_tool_pipeline.cd_pipeline.id)[1]
  resource_group            = var.resource_group
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
  kp_integration_name       = module.integrations.keyprotect_integration_name
}

module "integrations" {
  source                    = "./integrations"
  depends_on                = [ module.repositories, module.services ]  
  region                    = var.kp_region
  ibm_cloud_api_key         = var.ibm_cloud_api_key
  toolchain_id              = ibm_cd_toolchain.toolchain_instance.id
  resource_group            = var.resource_group
  key_protect_instance_name = module.services.key_protect_instance_name
  key_protect_instance_guid = module.services.key_protect_instance_guid
  slack_channel_name        = var.slack_channel_name
  slack_api_token           = var.slack_api_token
  slack_user_name           = var.slack_user_name
  scc_evidence_repo         = module.repositories.evidence_repo_url
  scc_profile               = var.scc_profile
  scc_scope                 = var.scc_scope
}

module "services" {
  source                    = "./services"
  key_protect_instance_name = var.kp_name
  region                    = var.region
  ibm_cloud_api             = var.ibm_cloud_api   
  cluster_name              = var.cluster_name
  cluster_namespace         = var.cluster_namespace
  cluster_region            = var.cluster_region
  registry_namespace        = var.registry_namespace
  registry_region           = var.registry_region   
}

output "toolchain_id" {
  value = ibm_cd_toolchain.toolchain_instance.id
}

output "key_protect_instance_id" {
  value = module.services.key_protect_instance_guid
}