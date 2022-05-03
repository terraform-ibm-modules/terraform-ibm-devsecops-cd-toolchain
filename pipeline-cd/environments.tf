resource "ibm_tekton_pipeline_property" "cd_pipeline_change_request_id" {
  name           = "change-request-id"
  type           = "TEXT"
  value          = "notAvailable"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_region" {
  name           = "region"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_satellite_cluster_group" {
  name           = "satellite-cluster-group"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_source_environment" {
  name           = "source-environment"
  type           = "TEXT"
  value          = "master"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_target_environment" {
  name           = "target-environment"
  type           = "TEXT"
  value          = "prod"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_use_v2_collector" {
  name           = "use-v2-collector"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_use_v2_summary" {
  name           = "use-v2-summary"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_emergency_label" {
  name           = "emergency-label"
  type           = "TEXT"
  value          = "EMERGENCY"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_version" {
  name           = "version"
  type           = "TEXT"
  value          = "v1"
  pipeline_id    = var.pipeline_id          
}


resource "ibm_tekton_pipeline_property" "cd_pipeline_pipeline_config" {
  name           = "pipeline-config"
  type           = "TEXT"
  value          = ".pipeline-config.yaml"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "TEXT"
  value          = "master"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "TEXT"
  value          = var.deployment_repo
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_evidence_repo" {
  name           = "evidence-repo"
  type           = "TEXT"
  value          = var.evidence_repo
  pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id       
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_inventory_repo" {
  name           = "inventory-repo"
  type           = "TEXT"
  value          = var.inventory_repo
  pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id       
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_incident_repo" {
  name           = "incident-repo"
  type           = "TEXT"
  value          = var.issues_repo
  pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id   
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_pipeline_debug" {
  name           = "pipeline-debug"
  type           = "TEXT"
  value          = "0"
  pipeline_id    = var.pipeline_id          
}

# resource "ibm_tekton_pipeline_property" "cd_pipeline_pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "SECURE"
#   value          = " "
#   pipeline_id    = var.pipeline_id          
# }

resource "ibm_tekton_pipeline_property" "cd_pipeline_slack_notifications" {
  name           = "slack-notifications"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "SECURE"
  value          = format("{vault::%s.ibmcloud-api-key}", var.kp_integration_name)
  pipeline_id    = var.pipeline_id          
}

// Limitation with issues repository url: How to fetch issues repository url 
// as it is created internally while creating application repository resource
resource "ibm_tekton_pipeline_property" "cd_pipeline_cluster_name" {
  name           = "cluster-name"
  type           = "TEXT"
  value          = var.cluster_name
  pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id        
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_cluster_namespace" {
  name           = "cluster-namespace"
  type           = "TEXT"
  value          = var.cluster_namespace
  pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id      
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_cluster_region" {
  name           = "cluster-region"
  type           = "TEXT"
  value          = var.cluster_region
  pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id       
}

# resource "ibm_tekton_pipeline_property" "cd_pipeline_cos_api_key" {
#   name           = "cos-api-key"
#   type           = "SECURE"
#   value          = " "
#   pipeline_id    = var.pipeline_id                   
# }

resource "ibm_tekton_pipeline_property" "cd_pipeline_cos_bucket_name" {
  name           = "cos-bucket-name"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_cos_endpoint" {
  name           = "cos-endpoint"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_doi_environment" {
  name           = "doi-environment"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_doi_toolchain_id" {
  name           = "doi_toolchain_id"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_tekton_pipeline_property" "cd_pipeline_ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "TEXT"
  value          = var.ibm_cloud_api
  pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id
}

resource "ibm_tekton_pipeline_trigger_property" "cd_pipeline_manual_trigger_property_app_name" {
   name           = "app-name"
   type           = "TEXT"
   value          = "hello-compliance-app"
   pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id
   trigger_id     = ibm_tekton_pipeline_trigger.cd_pipeline_manual_trigger.trigger[0].id
}

resource "ibm_tekton_pipeline_trigger_property" "cd_pipeline_manual_trigger_property_repository" {
   name           = "repository"
   type           = "TEXT"
   value          = var.inventory_repo
   pipeline_id    = ibm_tekton_pipeline.cd_pipeline_instance.pipeline_id
   trigger_id     = ibm_tekton_pipeline_trigger.cd_pipeline_manual_trigger.trigger[0].id
}