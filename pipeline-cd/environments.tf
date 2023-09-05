resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_change_request_id" {
  name        = "change-request-id"
  type        = "text"
  value       = var.change_request_id
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_region" {
  name        = "region"
  type        = "text"
  value       = var.region
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_satellite_cluster_group" {
  name        = "satellite-cluster-group"
  type        = "text"
  value       = var.satellite_cluster_group
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_source_environment" {
  name        = "source-environment"
  type        = "text"
  value       = var.source_environment
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_target_environment" {
  name        = "target-environment"
  type        = "text"
  value       = var.target_environment
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_merge-cra-sbom" {
  name        = "merge-cra-sbom"
  type        = "text"
  value       = var.merge_cra_sbom
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_emergency_label" {
  name        = "emergency-label"
  type        = "text"
  value       = var.emergency_label
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_version" {
  name        = "version"
  type        = "text"
  value       = var.app_version
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_config" {
  name        = "pipeline-config"
  type        = "text"
  value       = var.pipeline_config_path
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_config_branch" {
  name        = "pipeline-config-branch"
  type        = "text"
  value       = (var.pipeline_config_repo_branch == "") ? var.deployment_repo_branch : var.pipeline_config_repo_branch
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_config_repo" {
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, var.deployment_repo.tool_id)
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_evidence_repo" {
  name        = "evidence-repo"
  type        = "integration"
  value       = var.evidence_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_inventory_repo" {
  name        = "inventory-repo"
  type        = "integration"
  value       = var.inventory_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_incident_repo" {
  name        = "incident-repo"
  type        = "integration"
  value       = var.issues_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_debug" {
  name        = "pipeline-debug"
  type        = "text"
  value       = var.pipeline_debug
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

# resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "secure"
#   value          = ""
#   pipeline_id    = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
# }

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_slack_notifications" {
  name        = "slack-notifications"
  type        = "text"
  value       = var.slack_notifications
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_ibmcloud_api_key" {
  name        = "ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_ibmcloud_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

// Limitation with issues repository url: How to fetch issues repository url
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_name" {
  name        = "cluster"
  type        = "text"
  value       = var.cluster_name
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_namespace" {
  name        = "cluster-namespace"
  type        = "text"
  value       = var.cluster_namespace
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_region" {
  name        = "cluster-region"
  type        = "text"
  value       = var.cluster_region
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cos_api_key" {
  count       = (var.cos_bucket_name != "") ? 1 : 0
  name        = "cos-api-key"
  type        = "secure"
  value       = var.cos_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cos_bucket_name" {
  name        = "cos-bucket-name"
  type        = "text"
  value       = var.cos_bucket_name
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cos_endpoint" {
  name        = "cos-endpoint"
  type        = "text"
  value       = var.cos_endpoint
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_git_token_environment" {
  name        = "git-token"
  type        = "secure"
  value       = ""
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_doi_environment" {
  name        = "doi-environment"
  type        = "text"
  value       = var.doi_environment
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_ibm_cloud_api" {
  name        = "ibmcloud-api"
  type        = "text"
  value       = var.ibmcloud_api
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_doi_toolchain_id" {
  name        = "doi-toolchain-id"
  type        = "text"
  value       = var.doi_toolchain_id
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "compliance_base_image" {
  count       = (var.compliance_base_image == "") ? 0 : 1
  name        = "compliance-baseimage"
  type        = "text"
  value       = var.compliance_base_image
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_target_environment_purpose" {
  name        = "target-environment-purpose"
  enum        = ["pre_prod", "production"]
  value       = var.target_environment_purpose
  type        = "single_select"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}
resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_target_environment_detail" {
  name        = "target-environment-detail"
  type        = "text"
  value       = var.target_environment_detail
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}
resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_customer_impact" {
  name        = "customer-impact"
  enum        = ["critical", "high", "moderate", "low", "no_impact"]
  value       = var.customer_impact
  type        = "single_select"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_signing_validation" {
  count       = (var.code_signing_cert != "") ? 1 : 0
  name        = "code-signing-certificate"
  type        = "text"
  value       = var.code_signing_cert
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = var.enable_artifactory ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"
}
