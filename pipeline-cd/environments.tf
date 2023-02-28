resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_change_request_id" {
  name           = "change-request-id"
  type           = "text"
  value          = "notAvailable"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_region" {
  name           = "region"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_satellite_cluster_group" {
  name           = "satellite-cluster-group"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_source_environment" {
  name           = "source-environment"
  type           = "text"
  value          = "master"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_target_environment" {
  name           = "target-environment"
  type           = "text"
  value          = "prod"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_merge-cra-sbom" {
  name           = "merge-cra-sbom"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_opt-out-v1-evidence" {
  name           = "opt-out-v1-evidence"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_emergency_label" {
  name           = "emergency-label"
  type           = "text"
  value          = "EMERGENCY"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_version" {
  name           = "version"
  type           = "text"
  value          = "v1"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_config" {
  name           = "pipeline-config"
  type           = "text"
  value          = var.pipeline_config_path
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id    
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "text"
  value          = (var.pipeline_config_repo_branch == "") ? var.deployment_repo_branch: var.pipeline_config_repo_branch
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id  
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "integration"
  value          = try(var.pipeline_config_repo[0].tool_id,  var.deployment_repo[0].tool_id)
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_evidence_repo" {
  name           = "evidence-repo"
  type           = "integration"
  value          = var.evidence_repo.tool_id
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id  
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_inventory_repo" {
  name           = "inventory-repo"
  type           = "integration"
  value          = var.inventory_repo.tool_id
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_incident_repo" {
  name           = "incident-repo"
  type           = "integration"
  value          = var.issues_repo.tool_id
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_debug" {
  name           = "pipeline-debug"
  type           = "text"
  value          = "0"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id        
}

# resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "secure"
#   value          = ""
#   pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id      
# }

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_slack_notifications" {
  name           = "slack-notifications"
  type           = "text"
  value          = "0"
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "secure"
  value          = format("{vault::%s.${var.pipeline_ibmcloud_api_key_secret_name}}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

// Limitation with issues repository url: How to fetch issues repository url 
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_name" {
  name           = "cluster"
  type           = "text"
  value          = var.cluster_name
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id     
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_namespace" {
  name           = "cluster-namespace"
  type           = "text"
  value          = var.cluster_namespace
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id   
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_region" {
  name           = "cluster-region"
  type           = "text"
  value          = var.cluster_region
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id   
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cos_api_key" {
  name           = "cos-api-key"
  type           = "secure"
  value          = format("{vault::%s.${var.cos_api_key_secret_name}}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cos_bucket_name" {
  name           = "cos-bucket-name"
  type           = "text"
  value          = var.cos_bucket_name
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id                
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cos_endpoint" {
  name           = "cos-endpoint"
  type           = "text"
  value          = var.cos_endpoint
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id             
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_git_token_environment" {
  name           = "git-token"
  type           = "secure"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id              
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_doi_environment" {
  name           = "doi-environment"
  type           = "text"
  value          = var.doi_environment
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id              
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "text"
  value          = var.ibm_cloud_api
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_doi_toolchain_id" {
  name           = "doi-toolchain-id"
  type           = "text"
  value          = var.doi_toolchain_id
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id                
}

resource "ibm_cd_tekton_pipeline_property" "compliance_base_image" {
  count          = (var.compliance_base_image == "") ? 0:1
  name           = "compliance-baseimage"
  type           = "text"
  value          = var.compliance_base_image
  pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}
