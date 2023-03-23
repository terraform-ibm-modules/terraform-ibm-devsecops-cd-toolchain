variable "toolchain_resource_group" {
  type        = string
  description = "The resource group within which the toolchain will be created."
  default     = "Default"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API KEY to fetch cloud resources"
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud api key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "ibmcloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint"
  default     = "https://cloud.ibm.com"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud Region for the toolchain"
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the Toolchain."
  default     = "DevSecOps CD Toolchain - Terraform"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the Toolchain."
  default     = "Toolchain created with Terraform template for DevSecOps CD Best Practices"
}

variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster where the application will be deployed."
  default     = "mycluster-free"
}

variable "cluster_namespace" {
  type        = string
  description = "Namespace of the Kubernetes cluster where the application will be deployed."
  default     = "default"
}

variable "cluster_region" {
  type        = string
  description = "Region of the Kubernetes cluster where the application will be deployed."
  default     = "ibm:yp:us-south"
}

variable "deployment_repo_url" {
  type        = string
  description = "This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates."
  default     = ""
}

variable "deployment_repo" {
  type        = string
  description = "This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates."
  default     = ""
}

variable "deployment_repo_type" {
  type        = string
  description = "The repository type for deployment repo. One of [clone, link, hostedgit]"
  default     = "hostedgit"
}

variable "change_management_repo" {
  type        = string
  description = "This repository holds the change management requests created for the deployments."
  default     = ""
}

variable "change_management_repo_type" {
  type        = string
  description = "The repository type for change management repo. One of [clone, link, hostedgit]"
  default     = "hostedgit"
}

variable "inventory_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-inventory-locker for reference DevSecOps toolchain templates."
}

variable "inventory_repo_type" {
  type        = string
  description = "The repository type for inventory repo. One of [clone, link, hostedgit]"
  default     = "hostedgit"
}

variable "evidence_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "evidence_repo_type" {
  type        = string
  description = "The repository type for evidence repo. One of [clone, link, hostedgit]"
  default     = "hostedgit"
}

variable "issues_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "issues_repo_type" {
  type        = string
  description = "The repository type for issues repo. One of [clone, link, hostedgit]"
  default     = "hostedgit"
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the webhook secret in the secret provider."
  default     = "slack-webhook"
}

variable "enable_slack" {
  type        = bool
  description = "Set to true to create the integration"
  default     = false
}

variable "slack_channel_name" {
  type        = string
  description = "The Slack channel that notifications will be posted to."
  default     = "my-channel"
}

variable "slack_team_name" {
  type        = string
  description = "The Slack team name, which is the word or phrase before .slack.com in the team URL."
  default     = "my-team"
}

variable "slack_pipeline_fail" {
  type        = bool
  description = "Generate pipeline failed notifications."
  default     = true
}

variable "slack_pipeline_start" {
  type        = bool
  description = "Generate pipeline start notifications."
  default     = true
}

variable "slack_pipeline_success" {
  type        = bool
  description = "Generate pipeline succeeded notifications."
  default     = true
}

variable "slack_toolchain_bind" {
  type        = bool
  description = "Generate tool added to toolchain notifications."
  default     = true
}

variable "slack_toolchain_unbind" {
  type        = bool
  description = "Generate tool removed from toolchain notifications."
  default     = true
}

#variable "enable_private_worker" {
#  type        = bool
#  description = "Create a private worker integration"
#  default     = false
#}

variable "scc_profile" {
  type        = string
  description = "Security and Compliance Profile"
  default     = "IBM Cloud for Financial Services v0.4.0"
}

variable "scc_scope" {
  type        = string
  description = "Security and Compliance Scope"
  default     = "compliance-scope"
}

variable "scc_integration_name" {
  type        = string
  description = "The name of the SCC integration name"
  default     = "Devsecops Scope"
}

variable "scc_enable_scc" {
  type        = bool
  description = "Enable the SCC integration"
  default     = false
}

variable "scc_evidence_namespace" {
  type        = string
  description = "The kind of evidence to be displayed, cc or cd"
  default     = "cd"
}

variable "scc_trigger_scan" {
  type        = string
  description = "Can be set to 'enabled'. Note each scan may incur a charge."
  default     = "disabled"
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "Name of the IBM Cloud Storage api-key secret in the secret provider."
  default     = "cos-api-key"
}

variable "cos_endpoint" {
  type        = string
  description = "cos endpoint name"
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "cos bucket name"
  default     = ""
}

variable "sm_secret_group" {
  type        = string
  description = "The Secrets Manager secret group containing your secrets. "
  default     = "Default"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance. "
  default     = "default"
}

variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager instance where the secrets are stored."
  default     = "sm-compliance-secrets"
}

variable "sm_location" {
  type        = string
  description = "IBM Cloud location/region containing the Secrets Manager instance."
  default     = "us-south"
}

variable "kp_resource_group" {
  type        = string
  description = "The resource group containing the Key Protect instance."
  default     = "Default"
}

variable "kp_name" {
  type        = string
  description = "Name of the Key Protect instance where the secrets are stored."
  default     = "kp-compliance-secrets"
}

variable "kp_location" {
  type        = string
  description = "IBM Cloud location/region containing the Key Protect instance."
  default     = "us-south"
}

variable "enable_key_protect" {
  type        = bool
  description = "Set to enable Key Protect Integration."
  default     = false
}

variable "enable_secrets_manager" {
  type        = bool
  description = "Set to enable Secrets Manager Integration."
  default     = true
}

variable "change_repo_clone_from_url" {
  type        = string
  description = "Override the default management repo , which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
  default     = ""
}

variable "repositories_prefix" {
  type        = string
  description = "Prefix name for the cloned compliance repos."
  default     = "compliance-tf"
}

variable "deployment_repo_existing_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = "hostedgit"
}

variable "deployment_repo_existing_git_id" {
  type        = string
  description = "By default absent, else custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}

variable "deployment_repo_clone_to_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = ""
}

variable "deployment_repo_clone_to_git_id" {
  type        = string
  description = "By default absent, else custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}
variable "deployment_repo_clone_from_url" {
  type        = string
  description = "Override the default sample app by providing your own sample deployment url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
  default     = ""
}

variable "deployment_repo_clone_from_branch" {
  type        = string
  description = "Used when deployment_repo_clone_from_url is provided, the default branch that will be used by the CD build, usually either main or master."
  default     = ""
}
variable "deployment_repo_existing_url" {
  type        = string
  description = "Override to bring your own existing deployment repository URL, which will be used directly instead of cloning the default deployment sample."
  default     = ""
}
variable "deployment_repo_existing_branch" {
  type        = string
  description = "Used when deployment_repo_existing_url is provided, the default branch that will be used by the CD build, usually either main or master."
  default     = ""
}

variable "pipeline_config_repo_existing_url" {
  type        = string
  description = "Specify a repository containing a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo_branch" {
  type        = string
  description = "Specify the branch containing the custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo_clone_from_url" {
  type        = string
  description = "Specify a repository to clone that contains a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo" {
  type        = string
  description = "Specify the branch containing the custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_path" {
  type        = string
  description = "The name and path of the pipeline-config.yaml file within the pipeline-config repo"
  default     = ".pipeline-config.yaml"
}

variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code"
  default     = ""
}

variable "change_management_group" {
  type        = string
  description = "Specify GitLab user/group for change management repo"
  default     = ""
}

variable "authorization_policy_creation" {
  type        = string
  description = "Set to disabled if you do not want this policy auto created"
  default     = ""
}

variable "doi_environment" {
  type        = string
  description = "DevOpsInsights environment for DevSecOps CD deployment"
  default     = ""
}

variable "link_to_doi_toolchain" {
  description = "Enable a link to a DevOpsInsights instance in another toolchain, true or false"
  type        = bool
  default     = false
}

variable "doi_toolchain_id" {
  type        = string
  description = "DevOpsInsights Toolchain ID to link to"
  default     = ""
}

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "issues_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "deployment_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "change_management_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

#variable "private_worker_api_key_secret_name" {
#  type        = string
#  description = "Name of Private Worker service api key in the secret provider"
#  default     = "private-worker"
#}

variable "scc_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud api key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "pipeline_config_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "inventory_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "issues_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "evidence_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "deployment_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "compliance_pipeline_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "change_management_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "issues_group" {
  type        = string
  description = "Specify GitLab user/group for issues repo"
  default     = ""
}

variable "inventory_group" {
  type        = string
  description = "Specify GitLab user/group for inventory repo"
  default     = ""
}

variable "evidence_group" {
  type        = string
  description = "Specify GitLab user/group for evidence repo"
  default     = ""
}

variable "pipeline_config_group" {
  type        = string
  description = "Specify GitLab user/group for pipeline config repo"
  default     = ""
}

variable "deployment_group" {
  type        = string
  description = "Specify GitLab user/group for deployment repo"
  default     = ""
}

variable "compliance_pipeline_group" {
  type        = string
  description = "Specify GitLab user/group for compliance pipeline repo"
  default     = ""
}

variable "target_environment_detail" {
  type        = string
  description = "Details of the environment being updated"
  default     = ""
}

variable "customer_impact" {
  type        = string
  description = "Custom impact of the change request"
  default     = "no_impact"
}

variable "target_environment_purpose" {
  type        = string
  description = "Purpose of the environment being updated"
  default     = "production"
}

variable "change_request_id" {
  type        = string
  description = "The ID of an open change request. If this parameter is set to 'notAvailable' by default, a change request is automatically created by the continuous deployment pipeline."
  default     = "notAvailable"
}

variable "satellite_cluster_group" {
  type        = string
  description = "The Satellite cluster group"
  default     = ""
}

variable "source_environment" {
  type        = string
  description = "The source environment that the app is promoted from."
  default     = "master"
}

variable "target_environment" {
  type        = string
  description = "The target environment that the app is deployed to."
  default     = "prod"
}

variable "merge_cra_sbom" {
  type        = string
  description = "Merge the SBOM"
  default     = "1"
}

variable "opt_out_v1_evidence" {
  type        = string
  description = "Opt out of evidence v1"
  default     = "1"
}

variable "emergency_label" {
  type        = string
  description = "Identifies the pull request as an emergency."
  default     = "EMERGENCY"
}

variable "app_version" {
  type        = string
  description = "The version of the app to deploy."
  default     = "v1"
}

variable "slack_notifications" {
  type        = string
  description = "The switch that turns the Slack integration on or off"
  default     = "0"
}

variable "pipeline_debug" {
  type        = string
  description = "Set to '1' to enable debug logging"
  default     = "0"
}

variable "region" {
  type        = string
  description = "The target region where the app is deployed."
  default     = ""
}
