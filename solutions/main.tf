module "devsecops_cd_toolchain" {
  source                                         = "../"
  add_pipeline_definitions                       = var.add_pipeline_definitions
  artifactory_dashboard_url                      = var.artifactory_dashboard_url
  artifactory_integration_name                   = var.artifactory_integration_name
  artifactory_repo_name                          = var.artifactory_repo_name
  artifactory_repo_url                           = var.artifactory_repo_url
  artifactory_token_secret_crn                   = var.artifactory_token_secret_crn
  artifactory_token_secret_group                 = var.artifactory_token_secret_group
  artifactory_token_secret_name                  = var.artifactory_token_secret_name
  artifactory_user                               = var.artifactory_user
  authorization_policy_creation                  = var.authorization_policy_creation
  change_management_existing_url                 = var.change_management_existing_url
  change_management_group                        = var.change_management_group
  change_management_repo_auth_type               = var.change_management_repo_auth_type
  change_management_repo_blind_connection        = var.change_management_repo_blind_connection
  change_management_repo_git_id                  = var.change_management_repo_git_id
  change_management_repo_git_provider            = var.change_management_repo_git_provider
  change_management_repo_git_token_secret_crn    = var.change_management_repo_git_token_secret_crn
  change_management_repo_git_token_secret_name   = var.change_management_repo_git_token_secret_name
  change_management_repo_initialization_type     = var.change_management_repo_initialization_type
  change_management_repo_integration_owner       = var.change_management_repo_integration_owner
  change_management_repo_is_private_repo         = var.change_management_repo_is_private_repo
  change_management_repo_issues_enabled          = var.change_management_repo_issues_enabled
  change_management_repo_name                    = var.change_management_repo_name
  change_management_repo_root_url                = var.change_management_repo_root_url
  change_management_repo_secret_group            = var.change_management_repo_secret_group
  change_management_repo_title                   = var.change_management_repo_title
  change_management_repo_traceability_enabled    = var.change_management_repo_traceability_enabled
  change_repo_clone_from_url                     = var.change_repo_clone_from_url
  cluster_name                                   = var.cluster_name
  cluster_namespace                              = var.cluster_namespace
  cluster_region                                 = var.cluster_region
  code_engine_project                            = var.code_engine_project
  code_engine_region                             = var.code_engine_region
  code_engine_resource_group                     = var.code_engine_resource_group
  code_signing_cert_secret_crn                   = var.code_signing_cert_secret_crn
  code_signing_cert_secret_group                 = var.code_signing_cert_secret_group
  code_signing_cert_secret_name                  = var.code_signing_cert_secret_name
  compliance_pipeline_existing_repo_url          = var.compliance_pipeline_existing_repo_url
  compliance_pipeline_group                      = var.compliance_pipeline_group
  compliance_pipeline_repo_auth_type             = var.compliance_pipeline_repo_auth_type
  compliance_pipeline_repo_git_provider          = var.compliance_pipeline_repo_git_provider
  compliance_pipeline_repo_git_token_secret_crn  = var.compliance_pipeline_repo_git_token_secret_crn
  compliance_pipeline_repo_git_token_secret_name = var.compliance_pipeline_repo_git_token_secret_name
  compliance_pipeline_repo_integration_owner     = var.compliance_pipeline_repo_integration_owner
  compliance_pipeline_repo_issues_enabled        = var.compliance_pipeline_repo_issues_enabled
  compliance_pipeline_repo_secret_group          = var.compliance_pipeline_repo_secret_group
  compliance_pipeline_repo_url                   = var.compliance_pipeline_repo_url
  compliance_pipeline_source_repo_url            = var.compliance_pipeline_source_repo_url
  compliance_pipelines_repo_blind_connection     = var.compliance_pipelines_repo_blind_connection
  compliance_pipelines_repo_git_id               = var.compliance_pipelines_repo_git_id
  compliance_pipelines_repo_initialization_type  = var.compliance_pipelines_repo_initialization_type
  compliance_pipelines_repo_is_private_repo      = var.compliance_pipelines_repo_is_private_repo
  compliance_pipelines_repo_name                 = var.compliance_pipelines_repo_name
  compliance_pipelines_repo_root_url             = var.compliance_pipelines_repo_root_url
  compliance_pipelines_repo_title                = var.compliance_pipelines_repo_title
  compliance_pipelines_repo_traceability_enabled = var.compliance_pipelines_repo_traceability_enabled
  cos_api_key_secret_crn                         = var.cos_api_key_secret_crn
  cos_api_key_secret_group                       = var.cos_api_key_secret_group
  cos_api_key_secret_name                        = var.cos_api_key_secret_name
  cos_bucket_name                                = var.cos_bucket_name
  cos_dashboard_url                              = var.cos_dashboard_url
  cos_description                                = var.cos_description
  cos_documentation_url                          = var.cos_documentation_url
  cos_endpoint                                   = var.cos_endpoint
  cos_integration_name                           = var.cos_integration_name
  create_git_triggers                            = var.create_git_triggers
  create_triggers                                = var.create_triggers
  default_git_provider                           = var.default_git_provider
  default_locked_properties                      = var.default_locked_properties
  deployment_group                               = var.deployment_group
  deployment_repo_auth_type                      = var.deployment_repo_auth_type
  deployment_repo_blind_connection               = var.deployment_repo_blind_connection
  deployment_repo_clone_from_branch              = var.deployment_repo_clone_from_branch
  deployment_repo_clone_from_url                 = var.deployment_repo_clone_from_url
  deployment_repo_clone_to_git_id                = var.deployment_repo_clone_to_git_id
  deployment_repo_clone_to_git_provider          = var.deployment_repo_clone_to_git_provider
  deployment_repo_existing_branch                = var.deployment_repo_existing_branch
  deployment_repo_existing_git_id                = var.deployment_repo_existing_git_id
  deployment_repo_existing_git_provider          = var.deployment_repo_existing_git_provider
  deployment_repo_existing_url                   = var.deployment_repo_existing_url
  deployment_repo_git_token_secret_crn           = var.deployment_repo_git_token_secret_crn
  deployment_repo_git_token_secret_name          = var.deployment_repo_git_token_secret_name
  deployment_repo_initialization_type            = var.deployment_repo_initialization_type
  deployment_repo_integration_owner              = var.deployment_repo_integration_owner
  deployment_repo_is_private_repo                = var.deployment_repo_is_private_repo
  deployment_repo_issues_enabled                 = var.deployment_repo_issues_enabled
  deployment_repo_name                           = var.deployment_repo_name
  deployment_repo_root_url                       = var.deployment_repo_root_url
  deployment_repo_secret_group                   = var.deployment_repo_secret_group
  deployment_repo_title                          = var.deployment_repo_title
  deployment_repo_traceability_enabled           = var.deployment_repo_traceability_enabled
  deployment_source_repo_url                     = var.deployment_source_repo_url
  devsecops_flavor                               = var.devsecops_flavor
  doi_toolchain_id                               = var.doi_toolchain_id
  enable_artifactory                             = var.enable_artifactory
  enable_change_management_repo                  = var.enable_change_management_repo
  enable_insights                                = var.enable_insights
  enable_key_protect                             = var.enable_key_protect
  enable_pipeline_git_token                      = var.enable_pipeline_git_token
  enable_pipeline_notifications                  = var.enable_pipeline_notifications
  enable_privateworker                           = var.enable_privateworker
  enable_secrets_manager                         = var.enable_secrets_manager
  enable_slack                                   = var.enable_slack
  event_notifications_crn                        = var.event_notifications_crn
  event_notifications_tool_name                  = var.event_notifications_tool_name
  evidence_group                                 = var.evidence_group
  evidence_repo_auth_type                        = var.evidence_repo_auth_type
  evidence_repo_blind_connection                 = var.evidence_repo_blind_connection
  evidence_repo_git_id                           = var.evidence_repo_git_id
  evidence_repo_git_provider                     = var.evidence_repo_git_provider
  evidence_repo_git_token_secret_crn             = var.evidence_repo_git_token_secret_crn
  evidence_repo_git_token_secret_name            = var.evidence_repo_git_token_secret_name
  evidence_repo_initialization_type              = var.evidence_repo_initialization_type
  evidence_repo_integration_owner                = var.evidence_repo_integration_owner
  evidence_repo_is_private_repo                  = var.evidence_repo_is_private_repo
  evidence_repo_issues_enabled                   = var.evidence_repo_issues_enabled
  evidence_repo_name                             = var.evidence_repo_name
  evidence_repo_root_url                         = var.evidence_repo_root_url
  evidence_repo_secret_group                     = var.evidence_repo_secret_group
  evidence_repo_title                            = var.evidence_repo_title
  evidence_repo_traceability_enabled             = var.evidence_repo_traceability_enabled
  evidence_repo_url                              = var.evidence_repo_url
  ibmcloud_api_key                               = var.ibmcloud_api_key
  inventory_group                                = var.inventory_group
  inventory_repo_auth_type                       = var.inventory_repo_auth_type
  inventory_repo_blind_connection                = var.inventory_repo_blind_connection
  inventory_repo_git_id                          = var.inventory_repo_git_id
  inventory_repo_git_provider                    = var.inventory_repo_git_provider
  inventory_repo_git_token_secret_crn            = var.inventory_repo_git_token_secret_crn
  inventory_repo_git_token_secret_name           = var.inventory_repo_git_token_secret_name
  inventory_repo_initialization_type             = var.inventory_repo_initialization_type
  inventory_repo_integration_owner               = var.inventory_repo_integration_owner
  inventory_repo_is_private_repo                 = var.inventory_repo_is_private_repo
  inventory_repo_issues_enabled                  = var.inventory_repo_issues_enabled
  inventory_repo_name                            = var.inventory_repo_name
  inventory_repo_root_url                        = var.inventory_repo_root_url
  inventory_repo_secret_group                    = var.inventory_repo_secret_group
  inventory_repo_title                           = var.inventory_repo_title
  inventory_repo_traceability_enabled            = var.inventory_repo_traceability_enabled
  inventory_repo_url                             = var.inventory_repo_url
  issues_group                                   = var.issues_group
  issues_repo_auth_type                          = var.issues_repo_auth_type
  issues_repo_blind_connection                   = var.issues_repo_blind_connection
  issues_repo_git_id                             = var.issues_repo_git_id
  issues_repo_git_provider                       = var.issues_repo_git_provider
  issues_repo_git_token_secret_crn               = var.issues_repo_git_token_secret_crn
  issues_repo_git_token_secret_name              = var.issues_repo_git_token_secret_name
  issues_repo_initialization_type                = var.issues_repo_initialization_type
  issues_repo_integration_owner                  = var.issues_repo_integration_owner
  issues_repo_is_private_repo                    = var.issues_repo_is_private_repo
  issues_repo_issues_enabled                     = var.issues_repo_issues_enabled
  issues_repo_name                               = var.issues_repo_name
  issues_repo_root_url                           = var.issues_repo_root_url
  issues_repo_secret_group                       = var.issues_repo_secret_group
  issues_repo_title                              = var.issues_repo_title
  issues_repo_traceability_enabled               = var.issues_repo_traceability_enabled
  issues_repo_url                                = var.issues_repo_url
  kp_integration_name                            = var.kp_integration_name
  kp_location                                    = var.kp_location
  kp_name                                        = var.kp_name
  kp_resource_group                              = var.kp_resource_group
  link_to_doi_toolchain                          = var.link_to_doi_toolchain
  pipeline_branch                                = var.pipeline_branch
  pipeline_config_group                          = var.pipeline_config_group
  pipeline_config_repo_auth_type                 = var.pipeline_config_repo_auth_type
  pipeline_config_repo_blind_connection          = var.pipeline_config_repo_blind_connection
  pipeline_config_repo_branch                    = var.pipeline_config_repo_branch
  pipeline_config_repo_clone_from_url            = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_existing_url              = var.pipeline_config_repo_existing_url
  pipeline_config_repo_git_id                    = var.pipeline_config_repo_git_id
  pipeline_config_repo_git_provider              = var.pipeline_config_repo_git_provider
  pipeline_config_repo_git_token_secret_crn      = var.pipeline_config_repo_git_token_secret_crn
  pipeline_config_repo_git_token_secret_name     = var.pipeline_config_repo_git_token_secret_name
  pipeline_config_repo_initialization_type       = var.pipeline_config_repo_initialization_type
  pipeline_config_repo_integration_owner         = var.pipeline_config_repo_integration_owner
  pipeline_config_repo_is_private_repo           = var.pipeline_config_repo_is_private_repo
  pipeline_config_repo_issues_enabled            = var.pipeline_config_repo_issues_enabled
  pipeline_config_repo_name                      = var.pipeline_config_repo_name
  pipeline_config_repo_root_url                  = var.pipeline_config_repo_root_url
  pipeline_config_repo_secret_group              = var.pipeline_config_repo_secret_group
  pipeline_config_repo_title                     = var.pipeline_config_repo_title
  pipeline_config_repo_traceability_enabled      = var.pipeline_config_repo_traceability_enabled
  pipeline_doi_api_key_secret_crn                = var.pipeline_doi_api_key_secret_crn
  pipeline_doi_api_key_secret_group              = var.pipeline_doi_api_key_secret_group
  pipeline_doi_api_key_secret_name               = var.pipeline_doi_api_key_secret_name
  pipeline_git_tag                               = var.pipeline_git_tag
  pipeline_ibmcloud_api_key_secret_crn           = var.pipeline_ibmcloud_api_key_secret_crn
  pipeline_ibmcloud_api_key_secret_group         = var.pipeline_ibmcloud_api_key_secret_group
  pipeline_ibmcloud_api_key_secret_name          = var.pipeline_ibmcloud_api_key_secret_name
  pipeline_properties_filepath                   = var.pipeline_properties_filepath
  pipeline_properties                            = var.pipeline_properties
  privateworker_credentials_secret_crn           = var.privateworker_credentials_secret_crn
  privateworker_credentials_secret_group         = var.privateworker_credentials_secret_group
  privateworker_credentials_secret_name          = var.privateworker_credentials_secret_name
  privateworker_name                             = var.privateworker_name
  region                                         = var.region
  repositories_prefix                            = var.repositories_prefix
  repository_properties_filepath                 = var.repository_properties_filepath
  repository_properties                          = var.repository_properties
  repo_blind_connection                          = var.repo_blind_connection
  repo_git_id                                    = var.repo_git_id
  repo_git_provider                              = var.repo_git_provider
  repo_root_url                                  = var.repo_root_url
  repo_title                                     = var.repo_title
  repo_group                                     = var.repo_group
  repo_git_token_crn                             = var.repo_git_token_crn
  repo_git_token_secret_name                     = var.repo_git_token_secret_name
  repo_auth_type                                 = var.repo_auth_type
  repo_integration_owner                         = var.repo_integration_owner
  scc_attachment_id                              = var.scc_attachment_id
  scc_enable_scc                                 = var.scc_enable_scc
  scc_instance_crn                               = var.scc_instance_crn
  scc_integration_name                           = var.scc_integration_name
  scc_profile_name                               = var.scc_profile_name
  scc_profile_version                            = var.scc_profile_version
  scc_scc_api_key_secret_crn                     = var.scc_scc_api_key_secret_crn
  scc_scc_api_key_secret_group                   = var.scc_scc_api_key_secret_group
  scc_scc_api_key_secret_name                    = var.scc_scc_api_key_secret_name
  scc_use_profile_attachment                     = var.scc_use_profile_attachment
  slack_channel_name                             = var.slack_channel_name
  slack_integration_name                         = var.slack_integration_name
  slack_pipeline_fail                            = var.slack_pipeline_fail
  slack_pipeline_start                           = var.slack_pipeline_start
  slack_pipeline_success                         = var.slack_pipeline_success
  slack_team_name                                = var.slack_team_name
  slack_toolchain_bind                           = var.slack_toolchain_bind
  slack_toolchain_unbind                         = var.slack_toolchain_unbind
  slack_webhook_secret_crn                       = var.slack_webhook_secret_crn
  slack_webhook_secret_group                     = var.slack_webhook_secret_group
  slack_webhook_secret_name                      = var.slack_webhook_secret_name
  sm_instance_crn                                = var.sm_instance_crn
  sm_integration_name                            = var.sm_integration_name
  sm_location                                    = var.sm_location
  sm_name                                        = var.sm_name
  sm_resource_group                              = var.sm_resource_group
  sm_secret_group                                = var.sm_secret_group
  toolchain_description                          = var.toolchain_description
  toolchain_name                                 = var.toolchain_name
  toolchain_region                               = var.toolchain_region
  toolchain_resource_group                       = var.toolchain_resource_group
  trigger_git_enable                             = var.trigger_git_enable
  trigger_git_name                               = var.trigger_git_name
  trigger_git_promotion_branch                   = var.trigger_git_promotion_branch
  trigger_git_promotion_enable                   = var.trigger_git_promotion_enable
  trigger_git_promotion_listener                 = var.trigger_git_promotion_listener
  trigger_git_promotion_validation_name          = var.trigger_git_promotion_validation_name
  trigger_manual_enable                          = var.trigger_manual_enable
  trigger_manual_name                            = var.trigger_manual_name
  trigger_manual_promotion_enable                = var.trigger_manual_promotion_enable
  trigger_manual_promotion_name                  = var.trigger_manual_promotion_name
  trigger_manual_pruner_enable                   = var.trigger_manual_pruner_enable
  trigger_manual_pruner_name                     = var.trigger_manual_pruner_name
  trigger_timed_cron_schedule                    = var.trigger_timed_cron_schedule
  trigger_timed_enable                           = var.trigger_timed_enable
  trigger_timed_name                             = var.trigger_timed_name
  trigger_timed_pruner_enable                    = var.trigger_timed_pruner_enable
  trigger_timed_pruner_name                      = var.trigger_timed_pruner_name
  worker_id                                      = var.worker_id
}
