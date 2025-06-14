variable "toolchain_resource_group" {
  type        = string
  description = "The resource group within which the toolchain is created."
  default     = "Default"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "API key used to create the toolchain."
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider."
  default     = "ibmcloud-api-key"
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

variable "enable_privateworker" {
  type        = bool
  default     = false
  description = "Set true to enable private worker for the CD toolchain.|"
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
  default     = ""
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

variable "compliance_pipeline_existing_repo_url" {
  type        = string
  default     = ""
  description = "The URL of an existing compliance pipelines repository."
}

variable "compliance_pipeline_source_repo_url" {
  type        = string
  default     = ""
  description = "The URL of a compliance pipelines repository to clone."
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

variable "scc_evidence_locker_type" {
  type        = string
  description = "Allowable values are `evidence-repo` and `evidence-bucket`. If left unset, the SCC tool will behave as if `evidence-repo` has been set and will use the evidence repository configured in the toolchain. If the COS tool has been enabled, then the bucket name in `cos_bucket_name` will be provided to the SCC tool and `evidence-bucket` will be set. To override this behavior, explicitly set `scc_evidence_locker_type`."
  default     = ""
  validation {
    condition     = contains(["", "evidence-repo", "evidence-bucket"], var.scc_evidence_locker_type)
    error_message = "Must be either \"evidence-repo\" or \"evidence-bucket\" or left unset."
  }
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

variable "concert_dashboard_url" {
  type        = string
  description = "The dashboard URL for the Concert tool"
  default     = ""
}

variable "concert_description" {
  type        = string
  description = "The description of the Concert toolcard."
  default     = "IBM Concert combines traditional analytics and generative AI to deliver comprehensive insights into your operational health and identify critical risk across your application lifecycle"
}

variable "concert_documentation_url" {
  type        = string
  description = "The documentation URL that appears on the tool card."
  default     = "https://www.ibm.com/docs/en/concert"
}

variable "concert_integration_name" {
  type        = string
  description = "The name of the Concert integration."
  default     = "Concert"
}

variable "enable_concert" {
  type        = bool
  description = "Set to `true` to enable the Concert tool integration."
  default     = false
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "Name of the IBM Cloud Storage api-key secret in the secret provider."
  default     = ""
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

variable "cos_hmac_access_key_id_secret_name" {
  type        = string
  description = "The name of the secret in Secrets Manager for the HMAC Access Key ID."
  default     = ""
}

variable "cos_hmac_secret_access_key_secret_name" {
  type        = string
  description = "The name of the secret in Secrets Manager for the HMAC Secrte Access Key."
  default     = ""
}

variable "cos_integration_name" {
  type        = string
  description = "The name of the COS integration."
  default     = "Evidence Store"
}

variable "cos_instance_crn" {
  type        = string
  description = "The CRN of the Cloud Object Storage instance."
  default     = ""
}

variable "use_legacy_cos_tool" {
  type        = bool
  description = "The custom tool integration is being replaced with the new COS tool integration. To continue using the legacy tool. Set the value to `true`. See `enable_cos`"
  default     = false
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

variable "change_management_existing_url" {
  type        = string
  description = "The URL for an existing Change Management repository."
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

variable "deployment_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "deployment_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "deployment_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "enable_cos" {
  type        = bool
  description = "Set to `true` to enable the new COS integration."
  default     = false
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

variable "inventory_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "inventory_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "inventory_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "issues_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "issues_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "issues_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "evidence_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "evidence_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "evidence_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "compliance_pipelines_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "compliance_pipelines_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "compliance_pipelines_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "compliance_pipelines_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "compliance_pipelines_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = false
}

variable "compliance_pipelines_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "compliance_pipelines_repo_name" {
  type        = string
  description = "The repository name."
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

variable "change_management_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "change_management_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "change_management_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "pipeline_config_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "pipeline_config_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "pipeline_config_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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
  default     = ""
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
}

variable "issues_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
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
  default     = ""
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
  default     = ""
}

variable "change_management_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'."
  default     = ""
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

variable "code_signing_cert_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the code signing certificate."
  default     = ""
  validation {
    condition     = startswith(var.code_signing_cert_secret_crn, "crn:") || var.code_signing_cert_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "code_signing_cert_secret_group" {
  type        = string
  description = "Secret group prefix for the code signing certificate secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "code_signing_cert_secret_name" {
  type        = string
  description = "Set this variable with the name of the secret containing the GPG public key from the Secrets Provider."
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

variable "privateworker_name" {
  type        = string
  description = "The name of the private worker integration."
  default     = "private-worker-tool-01"
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

variable "cos_hmac_access_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the HMAC Secret Access Key. The HMAC Secret Access Key which is part of an HMAC (Hash Message Authentication Code) credential set. HMAC is identified by a combination of an Access Key ID and a Secret Access Key."
  default     = ""
  validation {
    condition     = startswith(var.cos_hmac_access_key_secret_crn, "crn:") || var.cos_hmac_access_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "cos_hmac_secret_access_id_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the HMAC Access Key ID. The HMAC Access Key ID which is part of an HMAC (Hash Message Authentication Code) credential set. HMAC is identified by a combination of an Access Key ID and a Secret Access Key."
  default     = ""
  validation {
    condition     = startswith(var.cos_hmac_secret_access_id_crn, "crn:") || var.cos_hmac_secret_access_id_crn == ""
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

variable "pipeline_doi_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
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

####### Trigger properties ###################
variable "create_triggers" {
  type        = bool
  description = "Set to `true` to create all the default triggers."
  default     = true
}

variable "create_git_triggers" {
  type        = string
  description = "Set to `true` to create the default Git triggers associated with the compliance repos and sample app."
  default     = "true"
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
  description = "The name of the CD pipeline Manual trigger."
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

######## DevSecOps Flavor ##################

variable "devsecops_flavor" {
  type        = string
  description = "The deployment target, 'kube', 'code-engine' or 'zos'."
  default     = "kube"
}

######## Code Engine Vars #####################
variable "code_engine_project" {
  type        = string
  description = "The name of the Code Engine project to use. Created if it does not exist."
  default     = ""
}

variable "code_engine_resource_group" {
  type        = string
  description = "The resource group of the Code Engine project."
  default     = ""
}

variable "code_engine_region" {
  type        = string
  description = "The region to create/lookup for the Code Engine project."
  default     = ""
}

variable "add_pipeline_definitions" {
  type        = string
  description = "Set to `true` to add pipeline definitions."
  default     = "true"
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

variable "default_locked_properties" {
  type        = list(string)
  description = "List of default locked properties"
  default     = ["allow_test_servicenow", "app-concurrency", "app-deployment-timeout", "app-max-scale", "app-min-scale", "app-port", "app-visibility", "artifact-signature-verification", "change-management-repo", "cluster", "cluster-namespace", "cluster-region", "code-engine-binding-resource-group", "code-engine-deployment-type", "code-engine-project", "code-engine-region", "code-engine-resource-group", "code-signing-certificate", "compliance-baseimage", "cos-api-key", "cos-bucket-name", "cos-endpoint", "cpu", "cra-bom-generate", "cra-deploy-analysis", "cra-vulnerability-scan", "doi-environment", "doi-ibmcloud-api-key", "doi-toolchain-id", "emergency-label", "env-from-configmaps", "env-from-secrets", "ephemeral-storage", "event-notifications", "evidence-repo", "git-token", "ibmcloud-api", "ibmcloud-api-key", "incident-repo", "inventory-repo", "job-instances", "job-maxexecutiontime", "job-retrylimit", "memory", "pipeline-config", "pipeline-config-branch", "pipeline-config-repo", "pnp-ibmcloud-api", "pnp-ibmcloud-api-key", "pre-prod-evidence-collection", "remove-unspecified-references-to-configuration-resources", "service-bindings", "servicenow-api-base-url", "servicenow-crn-mask", "slack-notifications", "version"]
}

variable "repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "repo_git_id" {
  type        = string
  description = "The Git ID for the compliance repositories."
  default     = ""
}

variable "repo_git_provider" {
  type        = string
  description = "The Git provider type."
  default     = ""
}

variable "repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "repo_group" {
  type        = string
  description = "Specify the Git user or group for your application. This must be set if the repository authentication type is `pat` (personal access token)."
  default     = ""
}

variable "repo_git_token_crn" {
  type        = string
  description = "The CRN of the  Git token secret in the secret provider. Specifying a CRN for the Git Token automatically sets the authentication type to `pat`."
  default     = ""
}

variable "repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider. Specifying a secret name for the Git Token automatically sets the authentication type to `pat`."
  default     = ""
}

variable "repo_auth_type" {
  type        = string
  description = "The auth type for the repo `oauth` or 'pat` (personal access token). Applies to all the default compliance repositories but can be overriden by the repository specific variable."
  default     = ""
}

variable "repo_integration_owner" {
  type        = string
  description = "The integration owner of the repository. Applies to all the default compliance repositories but can be overriden by the repository specific variable."
  default     = ""
}

variable "use_legacy_ref" {
  type        = bool
  description = "Set to `true` to use the legacy secret reference format for Secrets Manager secrets."
  default     = true
}
