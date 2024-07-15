resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_region" {
  name        = "region"
  type        = "text"
  value       = var.region
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

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_ibmcloud_api_key" {
  name        = "ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_ibmcloud_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_namespace" {
  count       = (var.deployment_target != "code-engine") ? 1 : 0
  name        = "cluster-namespace"
  type        = "text"
  value       = var.cluster_namespace
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_region" {
  count       = (var.deployment_target != "code-engine") ? 1 : 0
  name        = "cluster-region"
  type        = "text"
  value       = var.cluster_region
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cos_api_key" {
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

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_doi_api_key" {
  count       = var.link_to_doi_toolchain ? 1 : 0
  name        = "doi-ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_doi_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_doi_toolchain_id" {
  name        = "doi-toolchain-id"
  type        = "text"
  value       = var.doi_toolchain_id
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_signing_validation" {
  count       = (var.code_signing_cert_secret_ref != "") ? 1 : 0
  name        = "code-signing-certificate"
  type        = "secure"
  value       = (var.code_signing_cert == "") ? var.code_signing_cert_secret_ref : var.code_signing_cert
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_artifact_signature_verification" {
  count       = (var.artifact_signature_verification != "") ? 1 : 0
  name        = "artifact-signature-verification"
  type        = "text"
  value       = var.artifact_signature_verification
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

######## Code Engine Vars #####################
resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_project" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-project"
  type        = "text"
  value       = var.code_engine_project
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_region" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-region"
  type        = "text"
  value       = var.code_engine_region
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_event_notifications" {
  type        = "text"
  name        = "event-notifications"
  value       = var.event_notifications
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}
