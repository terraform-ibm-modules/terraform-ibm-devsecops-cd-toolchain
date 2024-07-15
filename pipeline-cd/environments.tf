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

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_ibmcloud_api_key" {
  name        = "ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_ibmcloud_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

// Limitation with issues repository url: How to fetch issues repository url
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_cluster_name" {
  count       = (var.deployment_target != "code-engine") ? 1 : 0
  name        = "cluster"
  type        = "text"
  value       = var.cluster_name
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

resource "ibm_cd_tekton_pipeline_property" "compliance_base_image" {
  count       = (var.compliance_base_image == "") ? 0 : 1
  name        = "compliance-baseimage"
  type        = "text"
  value       = var.compliance_base_image
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
  count       = (var.code_signing_cert_secret_ref != "") ? 1 : 0
  name        = "code-signing-certificate"
  type        = "secure"
  value       = (var.code_signing_cert == "") ? var.code_signing_cert_secret_ref : var.code_signing_cert
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_peer_review_collection" {
  name        = "peer-review-collection"
  type        = "text"
  value       = var.peer_review_collection
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

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_resource_group" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-resource-group"
  type        = "text"
  value       = var.code_engine_resource_group
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_binding_rg" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-binding-resource-group"
  type        = "text"
  value       = var.code_engine_binding_resource_group
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_deployment_type" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-deployment-type"
  type        = "text"
  value       = var.code_engine_deployment_type
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_cpu" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "cpu"
  type        = "text"
  value       = var.code_engine_cpu
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_memory" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "memory"
  type        = "text"
  value       = var.code_engine_memory
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_ephemeral_storage" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "ephemeral-storage"
  type        = "text"
  value       = var.code_engine_ephemeral_storage
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_execution_time" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "job-maxexecutiontime"
  type        = "text"
  value       = var.code_engine_job_maxexecutiontime
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_retry_limit" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "job-retrylimit"
  type        = "text"
  value       = var.code_engine_job_retrylimit
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_job_instances" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "job-instances"
  type        = "text"
  value       = var.code_engine_job_instances
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_port" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-port"
  type        = "text"
  value       = var.code_engine_app_port
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_min_scale" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-min-scale"
  type        = "text"
  value       = var.code_engine_app_min_scale
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_max_scale" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-max-scale"
  type        = "text"
  value       = var.code_engine_app_max_scale
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_deployment_timeout" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-deployment-timeout"
  type        = "text"
  value       = var.code_engine_app_deployment_timeout
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_concurrency" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-concurrency"
  type        = "text"
  value       = var.code_engine_app_concurrency
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_visibility" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-visibility"
  type        = "text"
  value       = var.code_engine_app_visibility
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_configmaps" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "env-from-configmaps"
  type        = "text"
  value       = var.code_engine_env_from_configmaps
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_env_secrets" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "env-from-secrets"
  type        = "text"
  value       = var.code_engine_env_from_secrets
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_remove_refs" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "remove-unspecified-references-to-configuration-resources"
  type        = "text"
  value       = var.code_engine_remove_refs
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_service_bindings" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "service-bindings"
  type        = "text"
  value       = var.code_engine_service_bindings
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_event_notifications" {
  type        = "text"
  name        = "event-notifications"
  value       = var.event_notifications
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_pre_prod_evidence_collection" {
  name        = "pre-prod-evidence-collection"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.pre_prod_evidence_collection
  pipeline_id = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}
