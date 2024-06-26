variable "toolchain_resource_group" {
  type        = string
  description = "The resource group within which the toolchain is created."
  default     = "Default"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "API key used to create the toolchains."
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "code_signing_cert" {
  type        = string
  sensitive   = true
  description = "The base64 encoded GPG public key. Setting this will add the public signing cert to the pipeline properties. Alternatively see `enable_signing_validation` to store the cert in a Secrets provider ."
  default     = ""
}

variable "enable_artifactory" {
  type        = bool
  default     = false
  description = "Set true to enable artifacory for devsecops."
}

variable "enable_pipeline_git_token" {
  type        = bool
  description = "Enable to add `git-token` to the pipeline properties."
  default     = false
}

variable "ibmcloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint."
  default     = "https://cloud.ibm.com"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud Region for the toolchain."
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of CD the Toolchain."
  default     = "DevSecOps CD Toolchain - Terraform"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the CD oolchain."
  default     = "Toolchain created with Terraform template for DevSecOps CD Best Practices"
}

variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster where the application is deployed."
  default     = "mycluster-free"
}

variable "cluster_namespace" {
  type        = string
  description = "Namespace of the Kubernetes cluster where the application is deployed."
  default     = "default"
}

variable "cluster_region" {
  type        = string
  description = "Region of the Kubernetes cluster where the application is deployed."
  default     = "ibm:yp:us-south"
}

variable "deployment_source_repo_url" {
  type        = string
  description = "Url of deployment repo template"
  default     = ""
}

variable "inventory_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-inventory-locker for reference DevSecOps toolchain templates."
  default     = ""
}

variable "evidence_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
  default     = ""
}

variable "issues_repo_url" {
  type        = string
  description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
  default     = ""
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the webhook secret in the secret provider."
  default     = "slack-webhook"
}

variable "enable_slack" {
  type        = bool
  description = "Set to true to create the integration."
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

variable "scc_integration_name" {
  type        = string
  description = "The name of the SCC integration name."
  default     = "Devsecops Scope"
}

variable "scc_enable_scc" {
  type        = bool
  description = "Enable the SCC integration."
  default     = true
}

variable "scc_attachment_id" {
  type        = string
  description = "An attachment ID. An attachment is configured under a profile to define how a scan will be run. To find the attachment ID, in the browser, in the attachments list, click on the attachment link, and a panel appears with a button to copy the attachment ID. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled."
  default     = ""
}

variable "scc_instance_crn" {
  type        = string
  description = "The Security and Compliance Center service instance CRN (Cloud Resource Name). This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. The value must match the regular expression."
  default     = ""
}

variable "scc_profile_name" {
  type        = string
  description = "The name of a Security and Compliance Center profile. Use the `IBM Cloud Framework for Financial Services` profile, which contains the DevSecOps Toolchain rules. Or use a user-authored customized profile that has been configured to contain those rules. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled."
  default     = ""
}

variable "scc_profile_version" {
  type        = string
  description = "The version of a Security and Compliance Center profile, in SemVer format, like `0.0.0`. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled."
  default     = ""
}

variable "scc_use_profile_attachment" {
  type        = string
  description = "Set to `enabled` to enable use profile with attachment, so that the scripts in the pipeline can interact with the Security and Compliance Center service. When enabled, other parameters become relevant; `scc_scc_api_key_secret_name`, `scc_instance_crn`, `scc_profile_name`, `scc_profile_version`, `scc_attachment_id`."
  default     = "disabled"
}

variable "scc_scc_api_key_secret_name" {
  type        = string
  description = "The Security and Compliance Center api-key secret in the secret provider."
  default     = "scc-api-key"
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "Name of the IBM Cloud Storage api-key secret in the secret provider."
  default     = "cos-api-key"
}

variable "pipeline_git_token_secret_name" {
  type        = string
  description = "Name of the pipeline Git token secret in the secret provider."
  default     = "pipeline-git-token"
}

variable "cos_endpoint" {
  type        = string
  description = "COS endpoint name."
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "COS bucket name."
  default     = ""
}

variable "cos_dashboard_url" {
  type        = string
  description = "The dashboard URL for the COS toolcard."
  default     = "https://cloud.ibm.com/objectstorage"
}

variable "cos_documentation_url" {
  type        = string
  description = "The documentation URL that appears on the tool card."
  default     = "https://cloud.ibm.com/objectstorage"
}

variable "cos_description" {
  type        = string
  description = "The COS description on the tool card."
  default     = "Cloud Object Storage to store evidences within DevSecOps Pipelines"
}

variable "cos_integration_name" {
  type        = string
  description = "The name of the COS integration."
  default     = "Evidence Store"
}

variable "sm_secret_group" {
  type        = string
  description = "Group in Secrets Manager for organizing/grouping secrets."
  default     = "Default"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance."
  default     = "default"
}

variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager instance where the secrets are stored. "
  default     = "sm-compliance-secrets"
}

variable "sm_location" {
  type        = string
  description = "IBM Cloud location/region containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance."
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

variable "region" {
  type        = string
  description = "IBM Cloud region used to prefix the `prod_latest` inventory repo branch."
  default     = ""
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
  default     = "compliance"
}
variable "default_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Choose the default git provider for app repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.default_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\"."
  }
}

variable "change_management_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Choose the default git provider for change management repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.change_management_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\"."
  }
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
  description = "Specify a repository containing a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_branch" {
  type        = string
  description = "Specify the branch containing the custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_clone_from_url" {
  type        = string
  description = "Specify a repository to clone that contains a custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_path" {
  type        = string
  description = "The name and path of the pipeline-config.yaml file within the pipeline-config repo."
  default     = ".pipeline-config.yaml"
}

variable "pipeline_branch" {
  type        = string
  description = "The branch within pipeline definitions repository for Compliance CD Toolchain."
  default     = "open-v10"
}

variable "pipeline_git_tag" {
  type        = string
  description = "The GIT tag within the pipeline definitions repository for Compliance CD Toolchain."
  default     = ""
}

variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code."
  default     = ""
}

variable "change_management_group" {
  type        = string
  description = "Specify Git user/group for change management repo."
  default     = ""
}

variable "authorization_policy_creation" {
  type        = string
  description = "Set to disabled if you do not want this policy auto created."
  default     = ""
}

variable "doi_environment" {
  type        = string
  description = "DevOpsInsights environment for DevSecOps CD deployment."
  default     = ""
}

variable "enable_insights" {
  type        = bool
  description = "Set to `true` to enable the DevOps Insights integration."
  default     = true
}
variable "link_to_doi_toolchain" {
  description = "Enable a link to a DevOpsInsights instance in another toolchain, true or false."
  type        = bool
  default     = false
}

variable "doi_toolchain_id" {
  type        = string
  description = "DevOps Insights Toolchain ID to link to."
  default     = ""
}

variable "pipeline_doi_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance."
  default     = ""
}

variable "pipeline_config_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for pipeline repo config"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.pipeline_config_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for pipeline config repo."
  }
}
variable "compliance_pipeline_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Choose the default git provider for change management repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.compliance_pipeline_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\"."
  }
}

variable "inventory_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for inventory repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.inventory_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for Inventory repo."
  }
}

variable "inventory_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "inventory_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "inventory_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "inventory_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "inventory_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "inventory_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "issues_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for issue repo "
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.issues_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for issue repo."
  }
}

variable "issues_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = true
}

variable "issues_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "issues_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "issues_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "issues_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "issues_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "evidence_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for evidence repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.evidence_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for evidence repo."
  }
}

variable "evidence_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "evidence_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "evidence_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "evidence_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "evidence_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "evidence_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "compliance_pipeline_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "compliance_pipelines_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "compliance_pipeline_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "compliance_pipeline_repo_url" {
  type        = string
  default     = ""
  description = "URL of pipeline repo template to be cloned."
}

variable "change_management_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = true
}

variable "change_management_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "change_management_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "change_management_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "change_management_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "change_management_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "change_management_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "enable_change_management_repo" {
  type        = string
  description = "Set to `true` to enable the Change Management Repo integration."
  default     = true
}

variable "pipeline_config_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "pipeline_config_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "pipeline_config_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "pipeline_config_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "pipeline_config_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "pipeline_config_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "pipeline_config_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "issues_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "issues_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "evidence_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "inventory_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "deployment_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat."
  default     = "oauth"
}

variable "deployment_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "deployment_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "deployment_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "deployment_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "deployment_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "deployment_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
}

variable "change_management_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = "oauth"
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

variable "code_signing_cert_secret_name" {
  type        = string
  description = "This is the optional alternative to using `code_signing_cert` for storing the GPG public signing key. Set this variable with the name of the secret containing the GPG public key from the Secrets Provider."
  default     = ""
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

variable "privateworker_credentials_secret_name" {
  type        = string
  default     = "private-worker-service-api"
  description = "Name of the privateworker secret in the secret provider."
}

variable "deployment_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Deployment repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.deployment_repo_git_token_secret_crn, "crn:") || var.deployment_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "change_management_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Change Managemenrt repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.change_management_repo_git_token_secret_crn, "crn:") || var.change_management_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "issues_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Issues repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.issues_repo_git_token_secret_crn, "crn:") || var.issues_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "evidence_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Evidence repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.evidence_repo_git_token_secret_crn, "crn:") || var.evidence_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "inventory_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Inventory repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.inventory_repo_git_token_secret_crn, "crn:") || var.inventory_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "compliance_pipeline_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Compliance Pipeline repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.compliance_pipeline_repo_git_token_secret_crn, "crn:") || var.compliance_pipeline_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_config_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Config repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_config_repo_git_token_secret_crn, "crn:") || var.pipeline_config_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "cos_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Cloud Object Storage apikey."
  default     = ""
  validation {
    condition     = startswith(var.cos_api_key_secret_crn, "crn:") || var.cos_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_ibmcloud_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the pipeline apikey."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_ibmcloud_api_key_secret_crn, "crn:") || var.pipeline_ibmcloud_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "slack_webhook_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Slack webhook secret."
  default     = ""
  validation {
    condition     = startswith(var.slack_webhook_secret_crn, "crn:") || var.slack_webhook_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "privateworker_credentials_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Private Worker apikey."
  default     = ""
  validation {
    condition     = startswith(var.privateworker_credentials_secret_crn, "crn:") || var.privateworker_credentials_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "artifactory_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Artifactory secret."
  default     = ""
  validation {
    condition     = startswith(var.artifactory_token_secret_crn, "crn:") || var.artifactory_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "scc_scc_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the SCC apikey."
  default     = ""
  validation {
    condition     = startswith(var.scc_scc_api_key_secret_crn, "crn:") || var.scc_scc_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Git Token secret in the pipeline properties."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_git_token_secret_crn, "crn:") || var.pipeline_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "code_signing_cert_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the public signing key cert in the secrets provider."
  default     = ""
  validation {
    condition     = startswith(var.code_signing_cert_secret_crn, "crn:") || var.code_signing_cert_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_doi_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the DOI apikey."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_doi_api_key_secret_crn, "crn:") || var.pipeline_doi_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "issues_group" {
  type        = string
  description = "Specify Git user/group for issues repo."
  default     = ""
}

variable "inventory_group" {
  type        = string
  description = "Specify Git user/group for inventory repo."
  default     = ""
}

variable "evidence_group" {
  type        = string
  description = "Specify Git user/group for evidence repo."
  default     = ""
}

variable "pipeline_config_group" {
  type        = string
  description = "Specify Git user/group for pipeline config repo."
  default     = ""
}

variable "deployment_group" {
  type        = string
  description = "Specify Git user/group for deployment repo."
  default     = ""
}

variable "compliance_pipeline_group" {
  type        = string
  description = "Specify Git user/group for compliance pipeline repo."
  default     = ""
}

variable "target_environment_detail" {
  type        = string
  description = "Details of the environment being updated."
  default     = "Production target environment"
}

variable "customer_impact" {
  type        = string
  description = "Custom impact of the change request."
  default     = "no_impact"
}

variable "target_environment_purpose" {
  type        = string
  description = "Purpose of the environment being updated."
  default     = "production"
}

variable "change_request_id" {
  type        = string
  description = "The ID of an open change request. If this parameter is set to 'notAvailable' by default, a change request is automatically created by the continuous deployment pipeline."
  default     = "notAvailable"
}

variable "satellite_cluster_group" {
  type        = string
  description = "The Satellite cluster group."
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
  description = "Merge the SBOM."
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
  description = "The switch that turns the Slack integration on or off."
  default     = "0"
}

variable "pipeline_debug" {
  type        = string
  description = "Set to '1' to enable debug logging."
  default     = "0"
}

variable "artifactory_integration_name" {
  type        = string
  default     = "artifactory-dockerconfigjson"
  description = "The name of the Artifactory tool integration."
}

variable "artifactory_user" {
  type        = string
  description = "Type the User ID or email for your Artifactory repository."
  default     = ""
}

variable "artifactory_dashboard_url" {
  type        = string
  default     = ""
  description = "Type the URL that you want to navigate to when you click the Artifactory integration tile."
}

variable "artifactory_repo_url" {
  type        = string
  default     = ""
  description = "Type the URL for your Artifactory release repository."
}

variable "artifactory_token_secret_name" {
  type        = string
  default     = "artifactory-token"
  description = "Name of the artifactory token secret in the secret provider."
}

variable "artifactory_repo_name" {
  type        = string
  default     = "wcp-compliance-automation-team-docker-local"
  description = "Type the name of your Artifactory repository where your docker images are located."
}

variable "sm_integration_name" {
  type        = string
  description = "The name of the Secrets Manager integration."
  default     = "sm-compliance-secrets"
}

variable "sm_instance_crn" {
  type        = string
  description = "The CRN of the Secrets Manager instance."
  default     = ""
}

variable "kp_integration_name" {
  type        = string
  description = "The name of the Key Protect integration."
  default     = "kp-compliance-secrets"
}

variable "slack_integration_name" {
  type        = string
  description = "The name of the Slack integration."
  default     = "slack-compliance"
}

variable "worker_id" {
  type        = string
  default     = "public"
  description = "The identifier for the Managed Pipeline worker."
}

variable "slack_webhook_secret_group" {
  type        = string
  description = "Secret group prefix for the Slack webhook secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "change_management_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Change Management repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "deployment_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Deployment repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "issues_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "inventory_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "evidence_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "compliance_pipeline_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_config_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "privateworker_credentials_secret_group" {
  type        = string
  description = "Secret group prefix for the Private Worker secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "scc_scc_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the Security and Compliance tool secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "artifactory_token_secret_group" {
  type        = string
  description = "Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "cos_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_ibmcloud_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_git_token_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline Git token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "code_signing_cert_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline Public signing key cert secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "force_redeploy" {
  type        = string
  description = "Forces the deployment or redeployment of the app even if the last deployment does not contain a delta in the inventory. Set this parameter to `true` to force a deployment of the app as if it is the first deployment on the specified target environment. By default, this parameter is set to `false`."
  default     = "false"
  validation {
    condition     = var.force_redeploy == "true" || var.force_redeploy == "false"
    error_message = "Must be a `true` or `false`."
  }
}

variable "pipeline_doi_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "peer_review_compliance" {
  type        = string
  description = "Set to `1` to enable peer review compliance validation."
  default     = "1"
}

variable "peer_review_collection" {
  type        = string
  description = "Set to `1` to enable peer review collection."
  default     = ""
}

variable "artifact_signature_verification" {
  type        = string
  description = "Set to `1` to enable artifact signature verification."
  default     = ""
}

####### Event Notifications #################
variable "event_notifications_tool_name" {
  type        = string
  description = "The name of the Event Notifications integration."
  default     = "Event Notifications"
}

variable "event_notifications_crn" {
  type        = string
  description = "The CRN for the Event Notifications instance."
  default     = ""
}

variable "enable_pipeline_notifications" {
  type        = bool
  description = "When enabled, pipeline run events will be sent to the Event Notifications and Slack integrations in the enclosing toolchain."
  default     = false

}

variable "event_notifications" {
  type        = string
  description = "To enable event notification, set event_notifications to 1 "
  default     = "0"
  validation {
    condition     = contains(["0", "1"], var.event_notifications)
    error_message = "Must be either \"0\" or \"1\" ."
  }
}

####### Trigger properties ###################
variable "create_triggers" {
  type        = bool
  description = "Set to `true` to create all the default triggers."
  default     = true
}

variable "trigger_git_name" {
  type        = string
  description = "The name of the CD pipeline GIT trigger."
  default     = "Git CD Trigger"
}
variable "trigger_git_enable" {
  type        = bool
  description = "Set to `true` to enable the CD pipeline Git trigger."
  default     = false
}

variable "trigger_timed_name" {
  type        = string
  description = "The name of the CD pipeline Timed trigger."
  default     = "Git CD Timed Trigger"
}
variable "trigger_timed_enable" {
  type        = bool
  description = "Set to `true` to enable the CD pipeline Timed trigger."
  default     = false
}
variable "trigger_timed_cron_schedule" {
  type        = string
  description = "Only needed for timed triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *_/2 * * * - every 2 hours."
  default     = "0 4 * * *"
}

variable "trigger_manual_name" {
  type        = string
  description = "The name of the CI pipeline Manual trigger."
  default     = "Manual CD Trigger"
}
variable "trigger_manual_enable" {
  type        = bool
  description = "Set to `true` to enable the CD pipeline Manual trigger."
  default     = true
}

variable "trigger_manual_promotion_name" {
  type        = string
  description = "The name of the CD pipeline Manual Promotion trigger."
  default     = "Manual Promotion Trigger"
}
variable "trigger_manual_promotion_enable" {
  type        = bool
  description = "Set to `true` to enable the CD pipeline Manual Promotion trigger."
  default     = true
}

variable "trigger_manual_pruner_name" {
  type        = string
  description = "The name of the manual Pruner trigger."
  default     = "Evidence Pruner Manual Trigger"
}

variable "trigger_manual_pruner_enable" {
  type        = bool
  description = "Set to `true` to enable the manual Pruner trigger."
  default     = true
}

variable "trigger_timed_pruner_name" {
  type        = string
  description = "The name of the timed Pruner trigger."
  default     = "Evidence Pruner Timed Trigger"
}
variable "trigger_timed_pruner_enable" {
  type        = bool
  description = "Set to `true` to enable the timed Pruner trigger."
  default     = false
}

variable "trigger_git_promotion_enable" {
  type        = bool
  description = "Enable Git promotion validation for Git promotion listener."
  default     = false
}

variable "trigger_git_promotion_listener" {
  type        = string
  description = "Select a Tekton EventListener to use when Git promotion validation listener trigger is fired."
  default     = "promotion-validation-listener-gitlab"
}

variable "trigger_git_promotion_validation_name" {
  type        = string
  description = "Name of Git Promotion Validation Trigger"
  default     = "Git Promotion Validation Trigger"
}

variable "trigger_git_promotion_branch" {
  type        = string
  description = "Branch for Git promotion validation listener."
  default     = "prod"
}

######## Deployment Strategy ##################

variable "deployment_target" {
  type        = string
  description = "The deployment target, 'cluster' or 'code-engine'."
  default     = "cluster"
}

######## Code Engine Vars #####################
variable "code_engine_project" {
  type        = string
  description = "The name of the Code Engine project to use. Created if it does not exist."
  default     = ""
}

variable "code_engine_region" {
  type        = string
  description = "The region to create/lookup for the Code Engine project."
  default     = ""
}

variable "code_engine_resource_group" {
  type        = string
  description = "The resource group of the Code Engine project."
  default     = ""
}

variable "code_engine_binding_resource_group" {
  type        = string
  description = "The name of a resource group to use for authentication for the service bindings of the Code Engine project. A service ID is created with Operator and Manager roles for all services in this resource group. Use '*' to specify all resource groups in this account. "
  default     = ""
}

variable "code_engine_deployment_type" {
  type        = string
  description = "type of Code Engine component to create/update as part of deployment. It can be either `application` or `job`."
  default     = "application"
}

variable "code_engine_cpu" {
  type        = string
  description = "The amount of CPU set for the instance of the application or job. "
  default     = "0.25"
}

variable "code_engine_memory" {
  type        = string
  description = "The amount of memory set for the instance of the application or job. Use M for megabytes or G for gigabytes."
  default     = "0.5G"
}

variable "code_engine_ephemeral_storage" {
  type        = string
  description = "The amount of ephemeral storage to set for the instance of the application or for the runs of the job. Use M for megabytes or G for gigabytes."
  default     = "0.4G"
}

variable "code_engine_job_maxexecutiontime" {
  type        = string
  description = "The maximum execution time in seconds for runs of the job."
  default     = "7200"
}

variable "code_engine_job_retrylimit" {
  type        = string
  description = "The number of times to rerun an instance of the job before the job is marked as failed."
  default     = "3"
}

variable "code_engine_job_instances" {
  type        = string
  description = "Specifies the number of instances that are used for runs of the job. When you use this option, the system converts to array indices. For example, if you specify instances of 5, the system converts to array-indices of 0 - 4. This option can only be specified if the --array-indices option is not specified. The default value is 1."
  default     = "1"
}

variable "code_engine_app_port" {
  type        = string
  description = "The port where the application listens. The format is `[NAME:]PORT`, where `[NAME:]` is optional. If `[NAME:]` is specified, valid values are `h2c`, or `http1`. When `[NAME:]` is not specified or is `http1`, the port uses `HTTP/1.1`. When `[NAME:]` is `h2c`, the port uses unencrypted `HTTP/2`."
  default     = "8080"
}

variable "code_engine_app_min_scale" {
  type        = string
  description = "The minimum number of instances that can be used for this application. This option is useful to ensure that no instances are running when not needed."
  default     = "0"
}

variable "code_engine_app_max_scale" {
  type        = string
  description = "The maximum number of instances that can be used for this application. If you set this value to 0, the application scales as needed. The application scaling is limited only by the instances per the resource quota for the project of your application."
  default     = "1"
}

variable "code_engine_app_deployment_timeout" {
  type        = string
  description = "The maximum timeout for the application deployment."
  default     = "300"
}

variable "code_engine_app_concurrency" {
  type        = string
  description = "The maximum number of requests that can be processed concurrently per instance."
  default     = "100"
}

variable "code_engine_app_visibility" {
  type        = string
  description = "The visibility for the application. Valid values are public, private and project. Setting a visibility of public means that your app can receive requests from the public internet or from components within the Code Engine project. Setting a visibility of private means that your app is not accessible from the public internet and network access is only possible from other IBM Cloud using Virtual Private Endpoints (VPE) or Code Engine components that are running in the same project. Visibility can only be private if the project supports application private visibility. Setting a visibility of project means that your app is not accessible from the public internet and network access is only possible from other Code Engine components that are running in the same project."
  default     = "public"
}

#variable "code_engine_CE_ENV_\<XXXX\>" {
#  type        = string
#  description = "Pipeline/trigger property (secured or not) to provide value for code engine environment variable <XXXX>."
#  default     = ""
#}

variable "code_engine_env_from_configmaps" {
  type        = string
  description = "Semi-colon separated list of configmaps to set environment variables."
  default     = ""
}

variable "code_engine_env_from_secrets" {
  type        = string
  description = "Semi-colon separated list of secrets to set environment variables."
  default     = ""
}

variable "code_engine_remove_refs" {
  type        = string
  description = "Remove references to unspecified configuration resources (configmap/secret) references (pulled from env-from-configmaps, env-from-secrets along with auto-managed by CD)."
  default     = "false"
}

variable "code_engine_service_bindings" {
  type        = string
  description = "JSON array including service name(s) (as a simple JSON string)."
  default     = ""
}

variable "pre_prod_evidence_collection" {
  type        = string
  description = "Set this flag to collect the pre-prod evidences and the change requests in the production deployment (target-environment-purpose set to production). Default value is 0."
  default     = "0"
  validation {
    condition     = contains(["0", "1"], var.pre_prod_evidence_collection)
    error_message = "Must be either \"0\" or \"1\" ."
  }
}

variable "pipeline_properties" {
  type        = string
  description = "Stringified JSON containing the properties. This takes precedence over the properties JSON."
  default     = ""
}

variable "pipeline_properties_filepath" {
  type        = string
  description = "The path to the file containing the property JSON. If this is not set, it will by default read the `properties.json` file at the root of the module."
  default     = ""
}

variable "repository_properties" {
  type        = string
  description = "Stringified JSON containing the repositories and triggers. This takes precedence over the repositories JSON."
  default     = ""
}

variable "repository_properties_filepath" {
  type        = string
  description = "The path to the file containing the repository and triggers JSON. If this is not set, it will by default read the `repositories.json` file at the root of the module."
  default     = ""
}
