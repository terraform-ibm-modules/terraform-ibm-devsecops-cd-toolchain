locals {
  # Note terraform 1.3.x allows startswith() function
  # but terraform 1.x uses regexall
  is_staging = length(regexall("^crn:v1:staging:.*$", var.toolchain_crn)) > 0
  # is_staging = startswith(var.toolchain_crn, "crn:v1:staging:")
  git_dev = "https://dev.us-south.git.test.cloud.ibm.com"
  git_mon01 = "https://mon01.git.cloud.ibm.com"
  git_fr2 = "https://private.eu-fr2.git.cloud.ibm.com"
  compliance_pipelines_git_server = (
    (local.is_staging) ? local.git_dev 
    : (var.toolchain_region == "eu-fr2")? local.git_fr2
    : format("https://%s.git.cloud.ibm.com", var.toolchain_region)
  )
  # in dev/staging, compliance_pipelines_git_server is dev and clone_from_git_server is mon01
  clone_from_git_server = (
    (local.is_staging) ? local.git_mon01 : local.compliance_pipelines_git_server
  )

  # deployment_repo_source = (
  #   (length(var.deployment_repo_clone_from_url) > 0)? var.deployment_repo_clone_from_url
  #   : format("%s/open-toolchain/hello-compliance-deployment.git", local.clone_from_git_server)
  # )

  change_management_repo_source = (
    (length(var.change_repo_clone_from_url) > 0)? var.change_repo_clone_from_url
    : format("%s/open-toolchain/compliance-change-management.git", local.clone_from_git_server)
  )

  deployment_repo_mode = ((length(var.deployment_repo_existing_url) > 0)? "byo_deployment"
    : (length(var.deployment_repo_clone_from_url) > 0) ? "byo_sample"
    : "auto-sample")

  deployment_repo_clone_from = (
    (local.deployment_repo_mode == "byo_deployment") ? ""
    : (local.deployment_repo_mode == "byo_sample") ? var.deployment_repo_clone_from_url
    : format("%s/open-toolchain/hello-compliance-deployment.git", local.clone_from_git_server)
  )
 deployment_repo_git_provider = (
    (local.deployment_repo_mode == "byo_deployment") ? 
        ((length(var.deployment_repo_existing_git_provider) > 0)? var.deployment_repo_existing_git_provider
          : "hostedgit"
        )
    : (local.deployment_repo_mode == "byo_sample") ?
        ((length(var.deployment_repo_clone_to_git_provider) > 0)? var.deployment_repo_clone_to_git_provider
          : "hostedgit"
        )
    : "hostedgit"
  )
  deployment_repo_git_id = (
    (local.deployment_repo_mode == "byo_deployment") ? 
        ((length(var.deployment_repo_existing_git_id) > 0)? var.deployment_repo_existing_git_id
          : ""
        )
    : (local.deployment_repo_mode == "byo_sample") ?
        ((length(var.deployment_repo_clone_to_git_id) > 0)? var.deployment_repo_clone_to_git_id
          : ""
        )
    : ""
  )
  deployment_repo_branch = (
    (local.deployment_repo_mode == "byo_deployment") ? 
        ((length(var.deployment_repo_existing_branch) > 0)? var.deployment_repo_existing_branch
          : file("[Error] var deployment_repo_existing_branch must be provided when using var deployment_repo_existing_url.")
        )
    : (local.deployment_repo_mode == "byo_sample") ?
        ((length(var.deployment_repo_clone_from_branch) > 0)? var.deployment_repo_clone_from_branch
          : file("[Error] var deployment_repo_clone_from_branch must be provided when using var deployment_repo_clone_from_url.")
        )
    : "master" # hello-compliance-deployment has branch master
  )

  pipeline_config_repo_branch = (
    (var.pipeline_config_repo_branch != "") ? 
    var.pipeline_config_repo_branch : (var.pipeline_config_repo_branch != "") ? 
    var.pipeline_config_repo_branch : local.deployment_repo_branch
  )
}


resource "ibm_cd_toolchain_tool_hostedgit" "deployment_repo_clone_from_hostedgit" {
  count = (local.deployment_repo_git_provider == "hostedgit" 
            && ((local.deployment_repo_mode == "byo_sample") 
                 || (local.deployment_repo_mode == "auto-sample") )
          ) ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "deployment-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = local.deployment_repo_clone_from
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "config-repo" ])
    git_id = local.deployment_repo_git_id
    owner_id = var.deployment_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    api_token                = ((var.deployment_repo_auth_type == "pat") ?
    format("{vault::%s.${var.deployment_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "deployment_repo_existing_hostedgit" {
  count = (local.deployment_repo_git_provider == "hostedgit" 
            && (local.deployment_repo_mode == "byo_deployment")
          ) ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "deployment-repo"
  initialization {
    type     = "link"
    repo_url = var.deployment_repo_existing_url
    git_id   = local.deployment_repo_git_id
    owner_id = var.deployment_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.deployment_repo_auth_type
    api_token                = ((var.deployment_repo_auth_type == "pat") ?
    format("{vault::%s.${var.deployment_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "change_management_repo" {
  toolchain_id = var.toolchain_id
  name         = "change-management-repo"
  initialization {
    type            = "clone_if_not_exists"
    source_repo_url = local.change_management_repo_source
    private_repo    = true
    repo_name       = join("-", [ var.repositories_prefix, "change-repo" ])
    owner_id        = var.change_management_group
  }  
  parameters {
    toolchain_issues_enabled = true
    enable_traceability      = false
    auth_type                = var.change_management_repo_auth_type
    api_token                = ((var.change_management_repo_auth_type == "pat") ?
    format("{vault::%s.${var.change_management_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_repo" {
  toolchain_id = var.toolchain_id
  name         = "pipeline-repo"  
  initialization {
    type = "link"
    repo_url = format("%s/open-toolchain/compliance-pipelines.git", local.compliance_pipelines_git_server)
    owner_id = var.compliance_pipeline_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.compliance_pipeline_repo_auth_type
    api_token                = ((var.compliance_pipeline_repo_auth_type == "pat") ?
    format("{vault::%s.${var.compliance_pipeline_repo_git_token_secret_name}}", var.secret_tool) : "")
    
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_config_repo_existing_hostedgit" {
  count = (var.pipeline_config_repo_existing_url == "") ? 0 : 1 
  toolchain_id = var.toolchain_id
  name         = "pipeline-config-repo"
  initialization {
    type     = "link"
    repo_url = var.pipeline_config_repo_existing_url
    git_id   = ""
    owner_id = var.pipeline_config_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.pipeline_config_repo_auth_type
    api_token                = ((var.pipeline_config_repo_auth_type == "pat") ?
    format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_config_repo_clone_from_hostedgit" {
  count = (var.pipeline_config_repo_clone_from_url == "") ? 0 : 1 

  toolchain_id = var.toolchain_id
  name         = "pipeline-config-repo"
  initialization {
    type            = "clone_if_not_exists"
    source_repo_url = var.pipeline_config_repo_clone_from_url
    private_repo    = true
    repo_name       = join("-", [ var.repositories_prefix, "pipeline-config-repo" ])
    git_id          = ""    
    owner_id        = var.pipeline_config_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.pipeline_config_repo_auth_type
    api_token                = ((var.pipeline_config_repo_auth_type == "pat") ?
    format("{vault::%s.${var.pipeline_config_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "inventory_repo" {
  toolchain_id = var.toolchain_id
  name         = "inventory-repo"
  initialization {
    type         = "link"
    repo_url     = var.inventory_repo_url
    private_repo = true
    owner_id     = var.inventory_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.inventory_repo_auth_type
    api_token                = ((var.inventory_repo_auth_type == "pat") ?
    format("{vault::%s.${var.inventory_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "evidence_repo" {
  toolchain_id = var.toolchain_id
  name         = "evidence-repo"
  initialization {
    type         = "link"
    repo_url     = var.evidence_repo_url
    private_repo = true
    owner_id     = var.evidence_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.evidence_repo_auth_type
    api_token                = ((var.evidence_repo_auth_type == "pat") ?
    format("{vault::%s.${var.evidence_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "issues_repo" {
  toolchain_id = var.toolchain_id
  name         = "issues-repo"
  initialization {
    type         = "link"
    repo_url     = var.issues_repo_url
    private_repo = true
    owner_id     = var.issues_group
  }
  parameters {
    toolchain_issues_enabled = true
    enable_traceability      = false
    auth_type                = var.issues_repo_auth_type
    api_token                = ((var.issues_repo_auth_type == "pat") ?
    format("{vault::%s.${var.issues_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "external_properties_repo" {
  count        = var.enable_external_properties ? 1 : 0
  toolchain_id = var.toolchain_id
  name         = "external-properties-repo"
  initialization {
    type            = "clone_if_not_exists"
    source_repo_url = var.external_properties_repo_url
    repo_name       = "compliance-pipeline-properties"
    owner_id        = var.pipeline_config_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
    auth_type                = var.external_properties_repo_auth_type
    api_token                = ((var.external_properties_repo_auth_type == "pat") ? 
    format("{vault::%s.${var.external_properties_repo_git_token_secret_name}}", var.secret_tool) : "")
  }
}

output "deployment_repo_url" {
  value = (((local.deployment_repo_git_provider == "hostedgit") && (local.deployment_repo_mode == "byo_deployment")) 
          ? ibm_cd_toolchain_tool_hostedgit.deployment_repo_existing_hostedgit[0].parameters[0].repo_url
          : ((local.deployment_repo_git_provider == "hostedgit") && (local.deployment_repo_mode != "byo_deployment")) 
          ? ibm_cd_toolchain_tool_hostedgit.deployment_repo_clone_from_hostedgit[0].parameters[0].repo_url
          : file("[Error] internal error in computing local values"))
  description = "The deployment repository instance url containing an application that can be built and deployed with the reference DevSecOps toolchain templates."
}

output "deployment_repo" {
  value = (((local.deployment_repo_git_provider == "hostedgit") && (local.deployment_repo_mode == "byo_deployment")) 
          ? ibm_cd_toolchain_tool_hostedgit.deployment_repo_existing_hostedgit
          : ((local.deployment_repo_git_provider == "hostedgit") && (local.deployment_repo_mode != "byo_deployment")) 
          ? ibm_cd_toolchain_tool_hostedgit.deployment_repo_clone_from_hostedgit
          : file("[Error] internal error in computing local values"))
  description = "The deployment repository containing an application that can be built and deployed with the reference DevSecOps toolchain templates."
}

output "deployment_repo_branch" {
  value = local.deployment_repo_branch
  description = "The deployment repository branch."
}

output "change_management_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.change_management_repo.parameters[0].repo_url
}

output "pipeline_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.pipeline_repo.parameters[0].repo_url
  description = "This repository url contains the tekton definitions for compliance pipelines"
}

output "pipeline_config_repo" {
  value = (var.pipeline_config_repo_existing_url == "") ? ibm_cd_toolchain_tool_hostedgit.pipeline_config_repo_clone_from_hostedgit : ibm_cd_toolchain_tool_hostedgit.pipeline_config_repo_existing_hostedgit
}

output "pipeline_config_repo_branch" {
  value = local.pipeline_config_repo_branch
  description = "The config or app repo branch containing the .pipeline-config.yaml file; usually main or master."
}

output "external_properties_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.external_properties_repo[0].parameters[0].repo_url
}

output "inventory_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo.parameters[0].repo_url
}

output "evidence_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo.parameters[0].repo_url
}

output "issues_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo.parameters[0].repo_url
}

output "inventory_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo
}

output "evidence_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo
}

output "issues_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo
}

 #output "test_output" {
 # value = format("test output: %s, is_staging %s, clone_from_git_server: %s, compliance_pipelines_git_server: %s",
 #    var.toolchain_crn, local.is_staging, local.clone_from_git_server, local.compliance_pipelines_git_server)
 #}