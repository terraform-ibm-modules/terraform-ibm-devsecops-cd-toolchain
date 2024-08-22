resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pipeline_config_repo" {
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, var.deployment_repo.tool_id)
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties, "pipeline-config-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_evidence_repo" {
  name        = "evidence-repo"
  type        = "integration"
  value       = var.evidence_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties, "evidence-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_inventory_repo" {
  name        = "inventory-repo"
  type        = "integration"
  value       = var.inventory_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties, "inventory-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_incident_repo" {
  name        = "incident-repo"
  type        = "integration"
  value       = var.issues_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties, "incident-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_signing_validation" {
  count       = (var.code_signing_cert_secret_ref != "") ? 1 : 0
  name        = "code-signing-certificate"
  type        = "secure"
  value       = (var.code_signing_cert == "") ? var.code_signing_cert_secret_ref : var.code_signing_cert
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties, "code-signing-certificate") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_artifact_signature_verification" {
  count       = (var.artifact_signature_verification != "") ? 1 : 0
  name        = "artifact-signature-verification"
  type        = "text"
  value       = var.artifact_signature_verification
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties, "artifact-signature-verification") ? "true" : "false"

}

resource "ibm_cd_tekton_pipeline_property" "cd_artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = var.enable_artifactory ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"
  locked      = contains(var.default_locked_properties, "artifactory-dockerconfigjson") ? "true" : "false"
}
