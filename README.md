<!-- BEGIN MODULE HOOK -->

<!-- Update the title to match the module name and add a description -->
## Terraform IBM DevSecOps CD Toolchain
<!-- UPDATE BADGE: Update the link for the following badge-->
![Stable (With quality checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-devsecops-cd-toolchain?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-devsecops-cd-toolchain/releases/latest)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

A Terraform module for provisioning the DevSecOps CD toolchain.

<!-- Remove the content in this H2 heading after completing the steps -->
<!-- Remove the content in this previous H2 heading -->


<!-- END EXAMPLES HOOK -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.70.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_change_management_repo"></a> [change\_management\_repo](#module\_change\_management\_repo) | ./customizations/repositories | n/a |
| <a name="module_compliance_pipelines_repo"></a> [compliance\_pipelines\_repo](#module\_compliance\_pipelines\_repo) | ./customizations/repositories | n/a |
| <a name="module_deployment_repo"></a> [deployment\_repo](#module\_deployment\_repo) | ./customizations/repositories | n/a |
| <a name="module_evidence_repo"></a> [evidence\_repo](#module\_evidence\_repo) | ./customizations/repositories | n/a |
| <a name="module_integrations"></a> [integrations](#module\_integrations) | ./integrations | n/a |
| <a name="module_inventory_repo"></a> [inventory\_repo](#module\_inventory\_repo) | ./customizations/repositories | n/a |
| <a name="module_issues_repo"></a> [issues\_repo](#module\_issues\_repo) | ./customizations/repositories | n/a |
| <a name="module_pipeline_cd"></a> [pipeline\_cd](#module\_pipeline\_cd) | ./pipeline-cd | n/a |
| <a name="module_pipeline_config_repo"></a> [pipeline\_config\_repo](#module\_pipeline\_config\_repo) | ./customizations/repositories | n/a |
| <a name="module_pipeline_properties"></a> [pipeline\_properties](#module\_pipeline\_properties) | ./customizations/pipeline-property-adder | n/a |
| <a name="module_repository_properties"></a> [repository\_properties](#module\_repository\_properties) | ./customizations/repository-adder | n/a |
| <a name="module_services"></a> [services](#module\_services) | ./services | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_cd_toolchain.toolchain_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain) | resource |
| [ibm_cd_toolchain_tool_pipeline.cd_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain_tool_pipeline) | resource |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_pipeline_definitions"></a> [add\_pipeline\_definitions](#input\_add\_pipeline\_definitions) | Set to `true` to add pipeline definitions. | `string` | `"true"` | no |
| <a name="input_artifactory_dashboard_url"></a> [artifactory\_dashboard\_url](#input\_artifactory\_dashboard\_url) | Type the URL that you want to navigate to when you click the Artifactory integration tile. | `string` | `""` | no |
| <a name="input_artifactory_integration_name"></a> [artifactory\_integration\_name](#input\_artifactory\_integration\_name) | The name of the Artifactory tool integration. | `string` | `"artifactory-dockerconfigjson"` | no |
| <a name="input_artifactory_repo_name"></a> [artifactory\_repo\_name](#input\_artifactory\_repo\_name) | Type the name of your Artifactory repository where your docker images are located. | `string` | `"wcp-compliance-automation-team-docker-local"` | no |
| <a name="input_artifactory_repo_url"></a> [artifactory\_repo\_url](#input\_artifactory\_repo\_url) | Type the URL for your Artifactory release repository. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_crn"></a> [artifactory\_token\_secret\_crn](#input\_artifactory\_token\_secret\_crn) | The CRN for the Artifactory secret. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_group"></a> [artifactory\_token\_secret\_group](#input\_artifactory\_token\_secret\_group) | Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_name"></a> [artifactory\_token\_secret\_name](#input\_artifactory\_token\_secret\_name) | Name of the artifactory token secret in the secret provider. | `string` | `"artifactory-token"` | no |
| <a name="input_artifactory_user"></a> [artifactory\_user](#input\_artifactory\_user) | Type the User ID or email for your Artifactory repository. | `string` | `""` | no |
| <a name="input_authorization_policy_creation"></a> [authorization\_policy\_creation](#input\_authorization\_policy\_creation) | Set to disabled if you do not want this policy auto created. | `string` | `""` | no |
| <a name="input_change_management_existing_url"></a> [change\_management\_existing\_url](#input\_change\_management\_existing\_url) | The URL for an existing Change Management repository. | `string` | `""` | no |
| <a name="input_change_management_group"></a> [change\_management\_group](#input\_change\_management\_group) | Specify Git user/group for change management repo. | `string` | `""` | no |
| <a name="input_change_management_repo_auth_type"></a> [change\_management\_repo\_auth\_type](#input\_change\_management\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `""` | no |
| <a name="input_change_management_repo_blind_connection"></a> [change\_management\_repo\_blind\_connection](#input\_change\_management\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_change_management_repo_git_id"></a> [change\_management\_repo\_git\_id](#input\_change\_management\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_change_management_repo_git_provider"></a> [change\_management\_repo\_git\_provider](#input\_change\_management\_repo\_git\_provider) | Choose the default git provider for change management repo | `string` | `"hostedgit"` | no |
| <a name="input_change_management_repo_git_token_secret_crn"></a> [change\_management\_repo\_git\_token\_secret\_crn](#input\_change\_management\_repo\_git\_token\_secret\_crn) | The CRN for the Change Managemenrt repository Git Token. | `string` | `""` | no |
| <a name="input_change_management_repo_git_token_secret_name"></a> [change\_management\_repo\_git\_token\_secret\_name](#input\_change\_management\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_change_management_repo_initialization_type"></a> [change\_management\_repo\_initialization\_type](#input\_change\_management\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_change_management_repo_integration_owner"></a> [change\_management\_repo\_integration\_owner](#input\_change\_management\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_change_management_repo_is_private_repo"></a> [change\_management\_repo\_is\_private\_repo](#input\_change\_management\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_change_management_repo_issues_enabled"></a> [change\_management\_repo\_issues\_enabled](#input\_change\_management\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `true` | no |
| <a name="input_change_management_repo_name"></a> [change\_management\_repo\_name](#input\_change\_management\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_change_management_repo_root_url"></a> [change\_management\_repo\_root\_url](#input\_change\_management\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_change_management_repo_secret_group"></a> [change\_management\_repo\_secret\_group](#input\_change\_management\_repo\_secret\_group) | Secret group prefix for the Change Management repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_change_management_repo_title"></a> [change\_management\_repo\_title](#input\_change\_management\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_change_management_repo_traceability_enabled"></a> [change\_management\_repo\_traceability\_enabled](#input\_change\_management\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_change_repo_clone_from_url"></a> [change\_repo\_clone\_from\_url](#input\_change\_repo\_clone\_from\_url) | Override the default management repo , which will be cloned into the app repo. Note, using clone\_if\_not\_exists mode, so if the app repo already exists the repo contents are unchanged. | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kubernetes cluster where the application is deployed. | `string` | `""` | no |
| <a name="input_cluster_namespace"></a> [cluster\_namespace](#input\_cluster\_namespace) | Namespace of the Kubernetes cluster where the application is deployed. | `string` | `"default"` | no |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | Region of the Kubernetes cluster where the application is deployed. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_code_engine_project"></a> [code\_engine\_project](#input\_code\_engine\_project) | The name of the Code Engine project to use. Created if it does not exist. | `string` | `""` | no |
| <a name="input_code_engine_region"></a> [code\_engine\_region](#input\_code\_engine\_region) | The region to create/lookup for the Code Engine project. | `string` | `""` | no |
| <a name="input_code_engine_resource_group"></a> [code\_engine\_resource\_group](#input\_code\_engine\_resource\_group) | The resource group of the Code Engine project. | `string` | `""` | no |
| <a name="input_code_signing_cert_secret_crn"></a> [code\_signing\_cert\_secret\_crn](#input\_code\_signing\_cert\_secret\_crn) | The CRN for the code signing certificate. | `string` | `""` | no |
| <a name="input_code_signing_cert_secret_group"></a> [code\_signing\_cert\_secret\_group](#input\_code\_signing\_cert\_secret\_group) | Secret group prefix for the code signing certificate secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_code_signing_cert_secret_name"></a> [code\_signing\_cert\_secret\_name](#input\_code\_signing\_cert\_secret\_name) | Set this variable with the name of the secret containing the GPG public key from the Secrets Provider. | `string` | `""` | no |
| <a name="input_compliance_pipeline_existing_repo_url"></a> [compliance\_pipeline\_existing\_repo\_url](#input\_compliance\_pipeline\_existing\_repo\_url) | The URL of an existing compliance pipelines repository. | `string` | `""` | no |
| <a name="input_compliance_pipeline_group"></a> [compliance\_pipeline\_group](#input\_compliance\_pipeline\_group) | Specify Git user/group for compliance pipeline repo. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_auth_type"></a> [compliance\_pipeline\_repo\_auth\_type](#input\_compliance\_pipeline\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_git_provider"></a> [compliance\_pipeline\_repo\_git\_provider](#input\_compliance\_pipeline\_repo\_git\_provider) | Choose the default git provider for change management repo | `string` | `"hostedgit"` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_crn"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_crn](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_crn) | The CRN for the Compliance Pipeline repository Git Token. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_name"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_name](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_compliance_pipeline_repo_integration_owner"></a> [compliance\_pipeline\_repo\_integration\_owner](#input\_compliance\_pipeline\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_issues_enabled"></a> [compliance\_pipeline\_repo\_issues\_enabled](#input\_compliance\_pipeline\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_compliance_pipeline_repo_secret_group"></a> [compliance\_pipeline\_repo\_secret\_group](#input\_compliance\_pipeline\_repo\_secret\_group) | Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_url"></a> [compliance\_pipeline\_repo\_url](#input\_compliance\_pipeline\_repo\_url) | URL of pipeline repo template to be cloned. | `string` | `""` | no |
| <a name="input_compliance_pipeline_source_repo_url"></a> [compliance\_pipeline\_source\_repo\_url](#input\_compliance\_pipeline\_source\_repo\_url) | The URL of a compliance pipelines repository to clone. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_blind_connection"></a> [compliance\_pipelines\_repo\_blind\_connection](#input\_compliance\_pipelines\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_git_id"></a> [compliance\_pipelines\_repo\_git\_id](#input\_compliance\_pipelines\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_initialization_type"></a> [compliance\_pipelines\_repo\_initialization\_type](#input\_compliance\_pipelines\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_is_private_repo"></a> [compliance\_pipelines\_repo\_is\_private\_repo](#input\_compliance\_pipelines\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `false` | no |
| <a name="input_compliance_pipelines_repo_name"></a> [compliance\_pipelines\_repo\_name](#input\_compliance\_pipelines\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_root_url"></a> [compliance\_pipelines\_repo\_root\_url](#input\_compliance\_pipelines\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_title"></a> [compliance\_pipelines\_repo\_title](#input\_compliance\_pipelines\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_traceability_enabled"></a> [compliance\_pipelines\_repo\_traceability\_enabled](#input\_compliance\_pipelines\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_concert_dashboard_url"></a> [concert\_dashboard\_url](#input\_concert\_dashboard\_url) | The dashboard URL for the Concert tool | `string` | `""` | no |
| <a name="input_concert_description"></a> [concert\_description](#input\_concert\_description) | The description of the Concert toolcard. | `string` | `"IBM Concert combines traditional analytics and generative AI to deliver comprehensive insights into your operational health and identify critical risk across your application lifecycle"` | no |
| <a name="input_concert_documentation_url"></a> [concert\_documentation\_url](#input\_concert\_documentation\_url) | The documentation URL that appears on the tool card. | `string` | `"https://www.ibm.com/docs/en/concert"` | no |
| <a name="input_concert_integration_name"></a> [concert\_integration\_name](#input\_concert\_integration\_name) | The name of the Concert integration. | `string` | `"Concert"` | no |
| <a name="input_cos_api_key_secret_crn"></a> [cos\_api\_key\_secret\_crn](#input\_cos\_api\_key\_secret\_crn) | The CRN for the Cloud Object Storage apikey. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_group"></a> [cos\_api\_key\_secret\_group](#input\_cos\_api\_key\_secret\_group) | Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_name"></a> [cos\_api\_key\_secret\_name](#input\_cos\_api\_key\_secret\_name) | Name of the IBM Cloud Storage api-key secret in the secret provider. | `string` | `""` | no |
| <a name="input_cos_bucket_name"></a> [cos\_bucket\_name](#input\_cos\_bucket\_name) | COS bucket name. | `string` | `""` | no |
| <a name="input_cos_dashboard_url"></a> [cos\_dashboard\_url](#input\_cos\_dashboard\_url) | The dashboard URL for the COS toolcard. | `string` | `"https://cloud.ibm.com/objectstorage"` | no |
| <a name="input_cos_description"></a> [cos\_description](#input\_cos\_description) | The COS description on the tool card. | `string` | `"Cloud Object Storage to store evidences within DevSecOps Pipelines"` | no |
| <a name="input_cos_documentation_url"></a> [cos\_documentation\_url](#input\_cos\_documentation\_url) | The documentation URL that appears on the tool card. | `string` | `"https://cloud.ibm.com/objectstorage"` | no |
| <a name="input_cos_endpoint"></a> [cos\_endpoint](#input\_cos\_endpoint) | COS endpoint name. | `string` | `""` | no |
| <a name="input_cos_hmac_access_key_id_secret_name"></a> [cos\_hmac\_access\_key\_id\_secret\_name](#input\_cos\_hmac\_access\_key\_id\_secret\_name) | The name of the secret in Secrets Manager for the HMAC Access Key ID. | `string` | `""` | no |
| <a name="input_cos_hmac_access_key_secret_crn"></a> [cos\_hmac\_access\_key\_secret\_crn](#input\_cos\_hmac\_access\_key\_secret\_crn) | The CRN for the HMAC Secret Access Key. The HMAC Secret Access Key which is part of an HMAC (Hash Message Authentication Code) credential set. HMAC is identified by a combination of an Access Key ID and a Secret Access Key. | `string` | `""` | no |
| <a name="input_cos_hmac_secret_access_id_crn"></a> [cos\_hmac\_secret\_access\_id\_crn](#input\_cos\_hmac\_secret\_access\_id\_crn) | The CRN for the HMAC Access Key ID. The HMAC Access Key ID which is part of an HMAC (Hash Message Authentication Code) credential set. HMAC is identified by a combination of an Access Key ID and a Secret Access Key. | `string` | `""` | no |
| <a name="input_cos_hmac_secret_access_key_secret_name"></a> [cos\_hmac\_secret\_access\_key\_secret\_name](#input\_cos\_hmac\_secret\_access\_key\_secret\_name) | The name of the secret in Secrets Manager for the HMAC Secrte Access Key. | `string` | `""` | no |
| <a name="input_cos_instance_crn"></a> [cos\_instance\_crn](#input\_cos\_instance\_crn) | The CRN of the Cloud Object Storage instance. | `string` | `""` | no |
| <a name="input_cos_integration_name"></a> [cos\_integration\_name](#input\_cos\_integration\_name) | The name of the COS integration. | `string` | `"Evidence Store"` | no |
| <a name="input_create_git_triggers"></a> [create\_git\_triggers](#input\_create\_git\_triggers) | Set to `true` to create the default Git triggers associated with the compliance repos and sample app. | `string` | `"true"` | no |
| <a name="input_create_triggers"></a> [create\_triggers](#input\_create\_triggers) | Set to `true` to create all the default triggers. | `bool` | `true` | no |
| <a name="input_default_git_provider"></a> [default\_git\_provider](#input\_default\_git\_provider) | Choose the default git provider for app repo | `string` | `"hostedgit"` | no |
| <a name="input_default_locked_properties"></a> [default\_locked\_properties](#input\_default\_locked\_properties) | List of default locked properties | `list(string)` | <pre>[<br/>  "allow_test_servicenow",<br/>  "app-concurrency",<br/>  "app-deployment-timeout",<br/>  "app-max-scale",<br/>  "app-min-scale",<br/>  "app-port",<br/>  "app-visibility",<br/>  "artifact-signature-verification",<br/>  "change-management-repo",<br/>  "cluster",<br/>  "cluster-namespace",<br/>  "cluster-region",<br/>  "code-engine-binding-resource-group",<br/>  "code-engine-deployment-type",<br/>  "code-engine-project",<br/>  "code-engine-region",<br/>  "code-engine-resource-group",<br/>  "code-signing-certificate",<br/>  "compliance-baseimage",<br/>  "cos-api-key",<br/>  "cos-bucket-name",<br/>  "cos-endpoint",<br/>  "cpu",<br/>  "cra-bom-generate",<br/>  "cra-deploy-analysis",<br/>  "cra-vulnerability-scan",<br/>  "doi-environment",<br/>  "doi-ibmcloud-api-key",<br/>  "doi-toolchain-id",<br/>  "emergency-label",<br/>  "env-from-configmaps",<br/>  "env-from-secrets",<br/>  "ephemeral-storage",<br/>  "event-notifications",<br/>  "evidence-repo",<br/>  "git-token",<br/>  "ibmcloud-api",<br/>  "ibmcloud-api-key",<br/>  "incident-repo",<br/>  "inventory-repo",<br/>  "job-instances",<br/>  "job-maxexecutiontime",<br/>  "job-retrylimit",<br/>  "memory",<br/>  "pipeline-config",<br/>  "pipeline-config-branch",<br/>  "pipeline-config-repo",<br/>  "pnp-ibmcloud-api",<br/>  "pnp-ibmcloud-api-key",<br/>  "pre-prod-evidence-collection",<br/>  "remove-unspecified-references-to-configuration-resources",<br/>  "service-bindings",<br/>  "servicenow-api-base-url",<br/>  "servicenow-crn-mask",<br/>  "slack-notifications",<br/>  "version"<br/>]</pre> | no |
| <a name="input_deployment_group"></a> [deployment\_group](#input\_deployment\_group) | Specify Git user/group for deployment repo. | `string` | `""` | no |
| <a name="input_deployment_repo_auth_type"></a> [deployment\_repo\_auth\_type](#input\_deployment\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat. | `string` | `""` | no |
| <a name="input_deployment_repo_blind_connection"></a> [deployment\_repo\_blind\_connection](#input\_deployment\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_deployment_repo_clone_from_branch"></a> [deployment\_repo\_clone\_from\_branch](#input\_deployment\_repo\_clone\_from\_branch) | Used when deployment\_repo\_clone\_from\_url is provided, the default branch that will be used by the CD build, usually either main or master. | `string` | `""` | no |
| <a name="input_deployment_repo_clone_from_url"></a> [deployment\_repo\_clone\_from\_url](#input\_deployment\_repo\_clone\_from\_url) | Override the default sample app by providing your own sample deployment url, which will be cloned into the app repo. Note, using clone\_if\_not\_exists mode, so if the app repo already exists the repo contents are unchanged. | `string` | `""` | no |
| <a name="input_deployment_repo_clone_to_git_id"></a> [deployment\_repo\_clone\_to\_git\_id](#input\_deployment\_repo\_clone\_to\_git\_id) | By default absent, else custom server GUID, or other options for 'git\_id' field in the browser UI. | `string` | `""` | no |
| <a name="input_deployment_repo_clone_to_git_provider"></a> [deployment\_repo\_clone\_to\_git\_provider](#input\_deployment\_repo\_clone\_to\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `""` | no |
| <a name="input_deployment_repo_existing_branch"></a> [deployment\_repo\_existing\_branch](#input\_deployment\_repo\_existing\_branch) | Used when deployment\_repo\_existing\_url is provided, the default branch that will be used by the CD build, usually either main or master. | `string` | `""` | no |
| <a name="input_deployment_repo_existing_git_id"></a> [deployment\_repo\_existing\_git\_id](#input\_deployment\_repo\_existing\_git\_id) | By default absent, else custom server GUID, or other options for 'git\_id' field in the browser UI. | `string` | `""` | no |
| <a name="input_deployment_repo_existing_git_provider"></a> [deployment\_repo\_existing\_git\_provider](#input\_deployment\_repo\_existing\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `"hostedgit"` | no |
| <a name="input_deployment_repo_existing_url"></a> [deployment\_repo\_existing\_url](#input\_deployment\_repo\_existing\_url) | Override to bring your own existing deployment repository URL, which will be used directly instead of cloning the default deployment sample. | `string` | `""` | no |
| <a name="input_deployment_repo_git_token_secret_crn"></a> [deployment\_repo\_git\_token\_secret\_crn](#input\_deployment\_repo\_git\_token\_secret\_crn) | The CRN for the Deployment repository Git Token. | `string` | `""` | no |
| <a name="input_deployment_repo_git_token_secret_name"></a> [deployment\_repo\_git\_token\_secret\_name](#input\_deployment\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_deployment_repo_initialization_type"></a> [deployment\_repo\_initialization\_type](#input\_deployment\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_deployment_repo_integration_owner"></a> [deployment\_repo\_integration\_owner](#input\_deployment\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_deployment_repo_is_private_repo"></a> [deployment\_repo\_is\_private\_repo](#input\_deployment\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_deployment_repo_issues_enabled"></a> [deployment\_repo\_issues\_enabled](#input\_deployment\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_deployment_repo_name"></a> [deployment\_repo\_name](#input\_deployment\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_deployment_repo_root_url"></a> [deployment\_repo\_root\_url](#input\_deployment\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_deployment_repo_secret_group"></a> [deployment\_repo\_secret\_group](#input\_deployment\_repo\_secret\_group) | Secret group prefix for the Deployment repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_deployment_repo_title"></a> [deployment\_repo\_title](#input\_deployment\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_deployment_repo_traceability_enabled"></a> [deployment\_repo\_traceability\_enabled](#input\_deployment\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_deployment_source_repo_url"></a> [deployment\_source\_repo\_url](#input\_deployment\_source\_repo\_url) | Url of deployment repo template | `string` | `""` | no |
| <a name="input_devsecops_flavor"></a> [devsecops\_flavor](#input\_devsecops\_flavor) | The deployment target, 'kube', 'code-engine' or 'zos'. | `string` | `"kube"` | no |
| <a name="input_doi_toolchain_id"></a> [doi\_toolchain\_id](#input\_doi\_toolchain\_id) | DevOps Insights Toolchain ID to link to. | `string` | `""` | no |
| <a name="input_enable_artifactory"></a> [enable\_artifactory](#input\_enable\_artifactory) | Set true to enable artifacory for devsecops. | `bool` | `false` | no |
| <a name="input_enable_change_management_repo"></a> [enable\_change\_management\_repo](#input\_enable\_change\_management\_repo) | Set to `true` to enable the Change Management Repo integration. | `string` | `true` | no |
| <a name="input_enable_concert"></a> [enable\_concert](#input\_enable\_concert) | Set to `true` to enable the Concert tool integration. | `bool` | `false` | no |
| <a name="input_enable_cos"></a> [enable\_cos](#input\_enable\_cos) | Set to `true` to enable the new COS integration. | `bool` | `false` | no |
| <a name="input_enable_insights"></a> [enable\_insights](#input\_enable\_insights) | Set to `true` to enable the DevOps Insights integration. | `bool` | `true` | no |
| <a name="input_enable_key_protect"></a> [enable\_key\_protect](#input\_enable\_key\_protect) | Set to enable Key Protect Integration. | `bool` | `false` | no |
| <a name="input_enable_pipeline_git_token"></a> [enable\_pipeline\_git\_token](#input\_enable\_pipeline\_git\_token) | Enable to add `git-token` to the pipeline properties. | `bool` | `false` | no |
| <a name="input_enable_pipeline_notifications"></a> [enable\_pipeline\_notifications](#input\_enable\_pipeline\_notifications) | When enabled, pipeline run events will be sent to the Event Notifications and Slack integrations in the enclosing toolchain. | `bool` | `false` | no |
| <a name="input_enable_privateworker"></a> [enable\_privateworker](#input\_enable\_privateworker) | Set true to enable private worker for the CD toolchain.\| | `bool` | `false` | no |
| <a name="input_enable_secrets_manager"></a> [enable\_secrets\_manager](#input\_enable\_secrets\_manager) | Set to enable Secrets Manager Integration. | `bool` | `true` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Set to true to create the integration. | `bool` | `false` | no |
| <a name="input_event_notifications_crn"></a> [event\_notifications\_crn](#input\_event\_notifications\_crn) | The CRN for the Event Notifications instance. | `string` | `""` | no |
| <a name="input_event_notifications_tool_name"></a> [event\_notifications\_tool\_name](#input\_event\_notifications\_tool\_name) | The name of the Event Notifications integration. | `string` | `"Event Notifications"` | no |
| <a name="input_evidence_group"></a> [evidence\_group](#input\_evidence\_group) | Specify Git user/group for evidence repo. | `string` | `""` | no |
| <a name="input_evidence_repo_auth_type"></a> [evidence\_repo\_auth\_type](#input\_evidence\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `""` | no |
| <a name="input_evidence_repo_blind_connection"></a> [evidence\_repo\_blind\_connection](#input\_evidence\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_evidence_repo_git_id"></a> [evidence\_repo\_git\_id](#input\_evidence\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_evidence_repo_git_provider"></a> [evidence\_repo\_git\_provider](#input\_evidence\_repo\_git\_provider) | Git provider for evidence repo | `string` | `"hostedgit"` | no |
| <a name="input_evidence_repo_git_token_secret_crn"></a> [evidence\_repo\_git\_token\_secret\_crn](#input\_evidence\_repo\_git\_token\_secret\_crn) | The CRN for the Evidence repository Git Token. | `string` | `""` | no |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence\_repo\_git\_token\_secret\_name](#input\_evidence\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_evidence_repo_initialization_type"></a> [evidence\_repo\_initialization\_type](#input\_evidence\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_evidence_repo_integration_owner"></a> [evidence\_repo\_integration\_owner](#input\_evidence\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_evidence_repo_is_private_repo"></a> [evidence\_repo\_is\_private\_repo](#input\_evidence\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_evidence_repo_issues_enabled"></a> [evidence\_repo\_issues\_enabled](#input\_evidence\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_evidence_repo_name"></a> [evidence\_repo\_name](#input\_evidence\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_evidence_repo_root_url"></a> [evidence\_repo\_root\_url](#input\_evidence\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_evidence_repo_secret_group"></a> [evidence\_repo\_secret\_group](#input\_evidence\_repo\_secret\_group) | Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_evidence_repo_title"></a> [evidence\_repo\_title](#input\_evidence\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_evidence_repo_traceability_enabled"></a> [evidence\_repo\_traceability\_enabled](#input\_evidence\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_evidence_repo_url"></a> [evidence\_repo\_url](#input\_evidence\_repo\_url) | This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates. | `string` | `""` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key used to create the toolchain. | `string` | n/a | yes |
| <a name="input_inventory_group"></a> [inventory\_group](#input\_inventory\_group) | Specify Git user/group for inventory repo. | `string` | `""` | no |
| <a name="input_inventory_repo_auth_type"></a> [inventory\_repo\_auth\_type](#input\_inventory\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `""` | no |
| <a name="input_inventory_repo_blind_connection"></a> [inventory\_repo\_blind\_connection](#input\_inventory\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_inventory_repo_git_id"></a> [inventory\_repo\_git\_id](#input\_inventory\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_inventory_repo_git_provider"></a> [inventory\_repo\_git\_provider](#input\_inventory\_repo\_git\_provider) | Git provider for inventory repo | `string` | `"hostedgit"` | no |
| <a name="input_inventory_repo_git_token_secret_crn"></a> [inventory\_repo\_git\_token\_secret\_crn](#input\_inventory\_repo\_git\_token\_secret\_crn) | The CRN for the Inventory repository Git Token. | `string` | `""` | no |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory\_repo\_git\_token\_secret\_name](#input\_inventory\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_inventory_repo_initialization_type"></a> [inventory\_repo\_initialization\_type](#input\_inventory\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_inventory_repo_integration_owner"></a> [inventory\_repo\_integration\_owner](#input\_inventory\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_inventory_repo_is_private_repo"></a> [inventory\_repo\_is\_private\_repo](#input\_inventory\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_inventory_repo_issues_enabled"></a> [inventory\_repo\_issues\_enabled](#input\_inventory\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_inventory_repo_name"></a> [inventory\_repo\_name](#input\_inventory\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_inventory_repo_root_url"></a> [inventory\_repo\_root\_url](#input\_inventory\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_inventory_repo_secret_group"></a> [inventory\_repo\_secret\_group](#input\_inventory\_repo\_secret\_group) | Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_inventory_repo_title"></a> [inventory\_repo\_title](#input\_inventory\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_inventory_repo_traceability_enabled"></a> [inventory\_repo\_traceability\_enabled](#input\_inventory\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_inventory_repo_url"></a> [inventory\_repo\_url](#input\_inventory\_repo\_url) | This is a template repository to clone compliance-inventory-locker for reference DevSecOps toolchain templates. | `string` | `""` | no |
| <a name="input_issues_group"></a> [issues\_group](#input\_issues\_group) | Specify Git user/group for issues repo. | `string` | `""` | no |
| <a name="input_issues_repo_auth_type"></a> [issues\_repo\_auth\_type](#input\_issues\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `""` | no |
| <a name="input_issues_repo_blind_connection"></a> [issues\_repo\_blind\_connection](#input\_issues\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_issues_repo_git_id"></a> [issues\_repo\_git\_id](#input\_issues\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_issues_repo_git_provider"></a> [issues\_repo\_git\_provider](#input\_issues\_repo\_git\_provider) | Git provider for issue repo | `string` | `"hostedgit"` | no |
| <a name="input_issues_repo_git_token_secret_crn"></a> [issues\_repo\_git\_token\_secret\_crn](#input\_issues\_repo\_git\_token\_secret\_crn) | The CRN for the Issues repository Git Token. | `string` | `""` | no |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues\_repo\_git\_token\_secret\_name](#input\_issues\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_issues_repo_initialization_type"></a> [issues\_repo\_initialization\_type](#input\_issues\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_issues_repo_integration_owner"></a> [issues\_repo\_integration\_owner](#input\_issues\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_issues_repo_is_private_repo"></a> [issues\_repo\_is\_private\_repo](#input\_issues\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_issues_repo_issues_enabled"></a> [issues\_repo\_issues\_enabled](#input\_issues\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `true` | no |
| <a name="input_issues_repo_name"></a> [issues\_repo\_name](#input\_issues\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_issues_repo_root_url"></a> [issues\_repo\_root\_url](#input\_issues\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_issues_repo_secret_group"></a> [issues\_repo\_secret\_group](#input\_issues\_repo\_secret\_group) | Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_issues_repo_title"></a> [issues\_repo\_title](#input\_issues\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_issues_repo_traceability_enabled"></a> [issues\_repo\_traceability\_enabled](#input\_issues\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_issues_repo_url"></a> [issues\_repo\_url](#input\_issues\_repo\_url) | This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates. | `string` | `""` | no |
| <a name="input_kp_integration_name"></a> [kp\_integration\_name](#input\_kp\_integration\_name) | The name of the Key Protect integration. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_location"></a> [kp\_location](#input\_kp\_location) | IBM Cloud location/region containing the Key Protect instance. | `string` | `"us-south"` | no |
| <a name="input_kp_name"></a> [kp\_name](#input\_kp\_name) | Name of the Key Protect instance where the secrets are stored. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_resource_group"></a> [kp\_resource\_group](#input\_kp\_resource\_group) | The resource group containing the Key Protect instance. | `string` | `"Default"` | no |
| <a name="input_link_to_doi_toolchain"></a> [link\_to\_doi\_toolchain](#input\_link\_to\_doi\_toolchain) | Enable a link to a DevOpsInsights instance in another toolchain, true or false. | `bool` | `false` | no |
| <a name="input_pipeline_branch"></a> [pipeline\_branch](#input\_pipeline\_branch) | The branch within pipeline definitions repository for Compliance CD Toolchain. | `string` | `"open-v10"` | no |
| <a name="input_pipeline_config_group"></a> [pipeline\_config\_group](#input\_pipeline\_config\_group) | Specify Git user/group for pipeline config repo. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline\_config\_repo\_auth\_type](#input\_pipeline\_config\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_blind_connection"></a> [pipeline\_config\_repo\_blind\_connection](#input\_pipeline\_config\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_branch"></a> [pipeline\_config\_repo\_branch](#input\_pipeline\_config\_repo\_branch) | Specify the branch containing the custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_clone_from_url"></a> [pipeline\_config\_repo\_clone\_from\_url](#input\_pipeline\_config\_repo\_clone\_from\_url) | Specify a repository to clone that contains a custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_existing_url"></a> [pipeline\_config\_repo\_existing\_url](#input\_pipeline\_config\_repo\_existing\_url) | Specify a repository containing a custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_id"></a> [pipeline\_config\_repo\_git\_id](#input\_pipeline\_config\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_provider"></a> [pipeline\_config\_repo\_git\_provider](#input\_pipeline\_config\_repo\_git\_provider) | Git provider for pipeline repo config | `string` | `"hostedgit"` | no |
| <a name="input_pipeline_config_repo_git_token_secret_crn"></a> [pipeline\_config\_repo\_git\_token\_secret\_crn](#input\_pipeline\_config\_repo\_git\_token\_secret\_crn) | The CRN for the Config repository Git Token. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_token_secret_name"></a> [pipeline\_config\_repo\_git\_token\_secret\_name](#input\_pipeline\_config\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_pipeline_config_repo_initialization_type"></a> [pipeline\_config\_repo\_initialization\_type](#input\_pipeline\_config\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_integration_owner"></a> [pipeline\_config\_repo\_integration\_owner](#input\_pipeline\_config\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_is_private_repo"></a> [pipeline\_config\_repo\_is\_private\_repo](#input\_pipeline\_config\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_pipeline_config_repo_issues_enabled"></a> [pipeline\_config\_repo\_issues\_enabled](#input\_pipeline\_config\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_pipeline_config_repo_name"></a> [pipeline\_config\_repo\_name](#input\_pipeline\_config\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_root_url"></a> [pipeline\_config\_repo\_root\_url](#input\_pipeline\_config\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_secret_group"></a> [pipeline\_config\_repo\_secret\_group](#input\_pipeline\_config\_repo\_secret\_group) | Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_title"></a> [pipeline\_config\_repo\_title](#input\_pipeline\_config\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_traceability_enabled"></a> [pipeline\_config\_repo\_traceability\_enabled](#input\_pipeline\_config\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_pipeline_doi_api_key_secret_crn"></a> [pipeline\_doi\_api\_key\_secret\_crn](#input\_pipeline\_doi\_api\_key\_secret\_crn) | The CRN for the DOI apikey. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_group"></a> [pipeline\_doi\_api\_key\_secret\_group](#input\_pipeline\_doi\_api\_key\_secret\_group) | Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_name"></a> [pipeline\_doi\_api\_key\_secret\_name](#input\_pipeline\_doi\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance. | `string` | `""` | no |
| <a name="input_pipeline_git_tag"></a> [pipeline\_git\_tag](#input\_pipeline\_git\_tag) | The GIT tag within the pipeline definitions repository for Compliance CD Toolchain. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_crn"></a> [pipeline\_ibmcloud\_api\_key\_secret\_crn](#input\_pipeline\_ibmcloud\_api\_key\_secret\_crn) | The CRN for the pipeline apikey. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_group"></a> [pipeline\_ibmcloud\_api\_key\_secret\_group](#input\_pipeline\_ibmcloud\_api\_key\_secret\_group) | Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline\_ibmcloud\_api\_key\_secret\_name](#input\_pipeline\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_pipeline_properties"></a> [pipeline\_properties](#input\_pipeline\_properties) | Stringified JSON containing the properties. This takes precedence over the properties JSON. | `string` | `""` | no |
| <a name="input_pipeline_properties_filepath"></a> [pipeline\_properties\_filepath](#input\_pipeline\_properties\_filepath) | The path to the file containing the property JSON. If this is not set, it will by default read the `properties.json` file at the root of the module. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_crn"></a> [privateworker\_credentials\_secret\_crn](#input\_privateworker\_credentials\_secret\_crn) | The CRN for the Private Worker apikey. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_group"></a> [privateworker\_credentials\_secret\_group](#input\_privateworker\_credentials\_secret\_group) | Secret group prefix for the Private Worker secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_name"></a> [privateworker\_credentials\_secret\_name](#input\_privateworker\_credentials\_secret\_name) | Name of the privateworker secret in the secret provider. | `string` | `"private-worker-service-api"` | no |
| <a name="input_privateworker_name"></a> [privateworker\_name](#input\_privateworker\_name) | The name of the private worker integration. | `string` | `"private-worker-tool-01"` | no |
| <a name="input_region"></a> [region](#input\_region) | IBM Cloud region used to prefix the `prod_latest` inventory repo branch. | `string` | `""` | no |
| <a name="input_repo_auth_type"></a> [repo\_auth\_type](#input\_repo\_auth\_type) | The auth type for the repo `oauth` or 'pat` (personal access token). Applies to all the default compliance repositories but can be overriden by the repository specific variable.` | `string` | `""` | no |
| <a name="input_repo_blind_connection"></a> [repo\_blind\_connection](#input\_repo\_blind\_connection) | Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server. | `string` | `""` | no |
| <a name="input_repo_git_id"></a> [repo\_git\_id](#input\_repo\_git\_id) | The Git ID for the compliance repositories. | `string` | `""` | no |
| <a name="input_repo_git_provider"></a> [repo\_git\_provider](#input\_repo\_git\_provider) | The Git provider type. | `string` | `""` | no |
| <a name="input_repo_git_token_crn"></a> [repo\_git\_token\_crn](#input\_repo\_git\_token\_crn) | The CRN of the  Git token secret in the secret provider. Specifying a CRN for the Git Token automatically sets the authentication type to `pat`. | `string` | `""` | no |
| <a name="input_repo_git_token_secret_name"></a> [repo\_git\_token\_secret\_name](#input\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. Specifying a secret name for the Git Token automatically sets the authentication type to `pat`. | `string` | `""` | no |
| <a name="input_repo_group"></a> [repo\_group](#input\_repo\_group) | Specify the Git user or group for your application. This must be set if the repository authentication type is `pat` (personal access token). | `string` | `""` | no |
| <a name="input_repo_integration_owner"></a> [repo\_integration\_owner](#input\_repo\_integration\_owner) | The integration owner of the repository. Applies to all the default compliance repositories but can be overriden by the repository specific variable. | `string` | `""` | no |
| <a name="input_repo_root_url"></a> [repo\_root\_url](#input\_repo\_root\_url) | (Optional) The Root URL of the server. e.g. https://git.example.com. | `string` | `""` | no |
| <a name="input_repo_title"></a> [repo\_title](#input\_repo\_title) | (Optional) The title of the server. e.g. My Git Enterprise Server. | `string` | `""` | no |
| <a name="input_repositories_prefix"></a> [repositories\_prefix](#input\_repositories\_prefix) | Prefix name for the cloned compliance repos. | `string` | `"compliance"` | no |
| <a name="input_repository_properties"></a> [repository\_properties](#input\_repository\_properties) | Stringified JSON containing the repositories and triggers. This takes precedence over the repositories JSON. | `string` | `""` | no |
| <a name="input_repository_properties_filepath"></a> [repository\_properties\_filepath](#input\_repository\_properties\_filepath) | The path to the file containing the repository and triggers JSON. If this is not set, it will by default read the `repositories.json` file at the root of the module. | `string` | `""` | no |
| <a name="input_scc_attachment_id"></a> [scc\_attachment\_id](#input\_scc\_attachment\_id) | An attachment ID. An attachment is configured under a profile to define how a scan will be run. To find the attachment ID, in the browser, in the attachments list, click on the attachment link, and a panel appears with a button to copy the attachment ID. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. | `string` | `""` | no |
| <a name="input_scc_enable_scc"></a> [scc\_enable\_scc](#input\_scc\_enable\_scc) | Enable the SCC integration. | `bool` | `true` | no |
| <a name="input_scc_evidence_locker_type"></a> [scc\_evidence\_locker\_type](#input\_scc\_evidence\_locker\_type) | Allowable values are `evidence-repo` and `evidence-bucket`. If left unset, the SCC tool will behave as if `evidence-repo` has been set and will use the evidence repository configured in the toolchain. If the COS tool has been enabled, then the bucket name in `cos_bucket_name` will be provided to the SCC tool and `evidence-bucket` will be set. To override this behavior, explicitly set `scc_evidence_locker_type`. | `string` | `""` | no |
| <a name="input_scc_instance_crn"></a> [scc\_instance\_crn](#input\_scc\_instance\_crn) | The Security and Compliance Center service instance CRN (Cloud Resource Name). This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. The value must match the regular expression. | `string` | `""` | no |
| <a name="input_scc_integration_name"></a> [scc\_integration\_name](#input\_scc\_integration\_name) | The name of the SCC integration name. | `string` | `"Devsecops Scope"` | no |
| <a name="input_scc_profile_name"></a> [scc\_profile\_name](#input\_scc\_profile\_name) | The name of a Security and Compliance Center profile. Use the `IBM Cloud Framework for Financial Services` profile, which contains the DevSecOps Toolchain rules. Or use a user-authored customized profile that has been configured to contain those rules. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. | `string` | `""` | no |
| <a name="input_scc_profile_version"></a> [scc\_profile\_version](#input\_scc\_profile\_version) | The version of a Security and Compliance Center profile, in SemVer format, like `0.0.0`. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. | `string` | `""` | no |
| <a name="input_scc_scc_api_key_secret_crn"></a> [scc\_scc\_api\_key\_secret\_crn](#input\_scc\_scc\_api\_key\_secret\_crn) | The CRN for the SCC apikey. | `string` | `""` | no |
| <a name="input_scc_scc_api_key_secret_group"></a> [scc\_scc\_api\_key\_secret\_group](#input\_scc\_scc\_api\_key\_secret\_group) | Secret group prefix for the Security and Compliance tool secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_scc_scc_api_key_secret_name"></a> [scc\_scc\_api\_key\_secret\_name](#input\_scc\_scc\_api\_key\_secret\_name) | The Security and Compliance Center api-key secret in the secret provider. | `string` | `"scc-api-key"` | no |
| <a name="input_scc_use_profile_attachment"></a> [scc\_use\_profile\_attachment](#input\_scc\_use\_profile\_attachment) | Set to `enabled` to enable use profile with attachment, so that the scripts in the pipeline can interact with the Security and Compliance Center service. When enabled, other parameters become relevant; `scc_scc_api_key_secret_name`, `scc_instance_crn`, `scc_profile_name`, `scc_profile_version`, `scc_attachment_id`. | `string` | `"disabled"` | no |
| <a name="input_slack_channel_name"></a> [slack\_channel\_name](#input\_slack\_channel\_name) | The Slack channel that notifications will be posted to. | `string` | `"my-channel"` | no |
| <a name="input_slack_integration_name"></a> [slack\_integration\_name](#input\_slack\_integration\_name) | The name of the Slack integration. | `string` | `"slack-compliance"` | no |
| <a name="input_slack_pipeline_fail"></a> [slack\_pipeline\_fail](#input\_slack\_pipeline\_fail) | Generate pipeline failed notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_start"></a> [slack\_pipeline\_start](#input\_slack\_pipeline\_start) | Generate pipeline start notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_success"></a> [slack\_pipeline\_success](#input\_slack\_pipeline\_success) | Generate pipeline succeeded notifications. | `bool` | `true` | no |
| <a name="input_slack_team_name"></a> [slack\_team\_name](#input\_slack\_team\_name) | The Slack team name, which is the word or phrase before .slack.com in the team URL. | `string` | `"my-team"` | no |
| <a name="input_slack_toolchain_bind"></a> [slack\_toolchain\_bind](#input\_slack\_toolchain\_bind) | Generate tool added to toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_toolchain_unbind"></a> [slack\_toolchain\_unbind](#input\_slack\_toolchain\_unbind) | Generate tool removed from toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_webhook_secret_crn"></a> [slack\_webhook\_secret\_crn](#input\_slack\_webhook\_secret\_crn) | The CRN for the Slack webhook secret. | `string` | `""` | no |
| <a name="input_slack_webhook_secret_group"></a> [slack\_webhook\_secret\_group](#input\_slack\_webhook\_secret\_group) | Secret group prefix for the Slack webhook secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_slack_webhook_secret_name"></a> [slack\_webhook\_secret\_name](#input\_slack\_webhook\_secret\_name) | Name of the webhook secret in the secret provider. | `string` | `"slack-webhook"` | no |
| <a name="input_sm_instance_crn"></a> [sm\_instance\_crn](#input\_sm\_instance\_crn) | The CRN of the Secrets Manager instance. | `string` | `""` | no |
| <a name="input_sm_integration_name"></a> [sm\_integration\_name](#input\_sm\_integration\_name) | The name of the Secrets Manager integration. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_location"></a> [sm\_location](#input\_sm\_location) | IBM Cloud location/region containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance. | `string` | `"us-south"` | no |
| <a name="input_sm_name"></a> [sm\_name](#input\_sm\_name) | Name of the Secrets Manager instance where the secrets are stored. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_resource_group"></a> [sm\_resource\_group](#input\_sm\_resource\_group) | The resource group containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance. | `string` | `"default"` | no |
| <a name="input_sm_secret_group"></a> [sm\_secret\_group](#input\_sm\_secret\_group) | Group in Secrets Manager for organizing/grouping secrets. | `string` | `"Default"` | no |
| <a name="input_toolchain_description"></a> [toolchain\_description](#input\_toolchain\_description) | Description for the CD oolchain. | `string` | `"Toolchain created with Terraform template for DevSecOps CD Best Practices"` | no |
| <a name="input_toolchain_name"></a> [toolchain\_name](#input\_toolchain\_name) | Name of CD the Toolchain. | `string` | `"DevSecOps CD Toolchain - Terraform"` | no |
| <a name="input_toolchain_region"></a> [toolchain\_region](#input\_toolchain\_region) | IBM Cloud Region for the toolchain. | `string` | `"us-south"` | no |
| <a name="input_toolchain_resource_group"></a> [toolchain\_resource\_group](#input\_toolchain\_resource\_group) | The resource group within which the toolchain is created. | `string` | `"Default"` | no |
| <a name="input_trigger_git_enable"></a> [trigger\_git\_enable](#input\_trigger\_git\_enable) | Set to `true` to enable the CD pipeline Git trigger. | `bool` | `false` | no |
| <a name="input_trigger_git_name"></a> [trigger\_git\_name](#input\_trigger\_git\_name) | The name of the CD pipeline GIT trigger. | `string` | `"Git CD Trigger"` | no |
| <a name="input_trigger_git_promotion_branch"></a> [trigger\_git\_promotion\_branch](#input\_trigger\_git\_promotion\_branch) | Branch for Git promotion validation listener. | `string` | `"prod"` | no |
| <a name="input_trigger_git_promotion_enable"></a> [trigger\_git\_promotion\_enable](#input\_trigger\_git\_promotion\_enable) | Enable Git promotion validation for Git promotion listener. | `bool` | `false` | no |
| <a name="input_trigger_git_promotion_listener"></a> [trigger\_git\_promotion\_listener](#input\_trigger\_git\_promotion\_listener) | Select a Tekton EventListener to use when Git promotion validation listener trigger is fired. | `string` | `"promotion-validation-listener-gitlab"` | no |
| <a name="input_trigger_git_promotion_validation_name"></a> [trigger\_git\_promotion\_validation\_name](#input\_trigger\_git\_promotion\_validation\_name) | Name of Git Promotion Validation Trigger | `string` | `"Git Promotion Validation Trigger"` | no |
| <a name="input_trigger_manual_enable"></a> [trigger\_manual\_enable](#input\_trigger\_manual\_enable) | Set to `true` to enable the CD pipeline Manual trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_name"></a> [trigger\_manual\_name](#input\_trigger\_manual\_name) | The name of the CD pipeline Manual trigger. | `string` | `"Manual CD Trigger"` | no |
| <a name="input_trigger_manual_promotion_enable"></a> [trigger\_manual\_promotion\_enable](#input\_trigger\_manual\_promotion\_enable) | Set to `true` to enable the CD pipeline Manual Promotion trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_promotion_name"></a> [trigger\_manual\_promotion\_name](#input\_trigger\_manual\_promotion\_name) | The name of the CD pipeline Manual Promotion trigger. | `string` | `"Manual Promotion Trigger"` | no |
| <a name="input_trigger_manual_pruner_enable"></a> [trigger\_manual\_pruner\_enable](#input\_trigger\_manual\_pruner\_enable) | Set to `true` to enable the manual Pruner trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_pruner_name"></a> [trigger\_manual\_pruner\_name](#input\_trigger\_manual\_pruner\_name) | The name of the manual Pruner trigger. | `string` | `"Evidence Pruner Manual Trigger"` | no |
| <a name="input_trigger_timed_cron_schedule"></a> [trigger\_timed\_cron\_schedule](#input\_trigger\_timed\_cron\_schedule) | Only needed for timed triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *\_/2 * * * - every 2 hours. | `string` | `"0 4 * * *"` | no |
| <a name="input_trigger_timed_enable"></a> [trigger\_timed\_enable](#input\_trigger\_timed\_enable) | Set to `true` to enable the CD pipeline Timed trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_name"></a> [trigger\_timed\_name](#input\_trigger\_timed\_name) | The name of the CD pipeline Timed trigger. | `string` | `"Git CD Timed Trigger"` | no |
| <a name="input_trigger_timed_pruner_enable"></a> [trigger\_timed\_pruner\_enable](#input\_trigger\_timed\_pruner\_enable) | Set to `true` to enable the timed Pruner trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_pruner_name"></a> [trigger\_timed\_pruner\_name](#input\_trigger\_timed\_pruner\_name) | The name of the timed Pruner trigger. | `string` | `"Evidence Pruner Timed Trigger"` | no |
| <a name="input_use_legacy_cos_tool"></a> [use\_legacy\_cos\_tool](#input\_use\_legacy\_cos\_tool) | The custom tool integration is being replaced with the new COS tool integration. To continue using the legacy tool. Set the value to `true`. See `enable_cos` | `bool` | `false` | no |
| <a name="input_use_legacy_ref"></a> [use\_legacy\_ref](#input\_use\_legacy\_ref) | Set to `true` to use the legacy secret reference format for Secrets Manager secrets. | `bool` | `true` | no |
| <a name="input_worker_id"></a> [worker\_id](#input\_worker\_id) | The identifier for the Managed Pipeline worker. | `string` | `"public"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cd_pipeline_id"></a> [cd\_pipeline\_id](#output\_cd\_pipeline\_id) | The CD pipeline ID. |
| <a name="output_change_management_repo"></a> [change\_management\_repo](#output\_change\_management\_repo) | The Change Management repository. |
| <a name="output_change_management_repo_git_id"></a> [change\_management\_repo\_git\_id](#output\_change\_management\_repo\_git\_id) | The issues repository Git ID |
| <a name="output_change_management_repo_git_provider"></a> [change\_management\_repo\_git\_provider](#output\_change\_management\_repo\_git\_provider) | The issues repository provider type. Can be 'hostedgit', 'githubconsolidated' etc. |
| <a name="output_change_management_repo_url"></a> [change\_management\_repo\_url](#output\_change\_management\_repo\_url) | The change management repository instance URL. |
| <a name="output_deployment_repo"></a> [deployment\_repo](#output\_deployment\_repo) | The Deployment repo. |
| <a name="output_deployment_repo_git_id"></a> [deployment\_repo\_git\_id](#output\_deployment\_repo\_git\_id) | The deployment repository Git ID |
| <a name="output_deployment_repo_git_provider"></a> [deployment\_repo\_git\_provider](#output\_deployment\_repo\_git\_provider) | The deployment repository provider type. Can be 'hostedgit', 'githubconsolidated' etc. |
| <a name="output_deployment_repo_url"></a> [deployment\_repo\_url](#output\_deployment\_repo\_url) | The deployment repo URL. |
| <a name="output_evidence_repo"></a> [evidence\_repo](#output\_evidence\_repo) | The Evidence repo. |
| <a name="output_evidence_repo_git_id"></a> [evidence\_repo\_git\_id](#output\_evidence\_repo\_git\_id) | The evidence repository Git ID |
| <a name="output_evidence_repo_git_provider"></a> [evidence\_repo\_git\_provider](#output\_evidence\_repo\_git\_provider) | The evidence repository provider type. Can be 'hostedgit', 'githubconsolidated' etc. |
| <a name="output_evidence_repo_url"></a> [evidence\_repo\_url](#output\_evidence\_repo\_url) | The evidence repository instance URL, where evidence of the builds and scans are stored, ready for any compliance audit. |
| <a name="output_inventory_repo"></a> [inventory\_repo](#output\_inventory\_repo) | The Inventory repo. |
| <a name="output_inventory_repo_git_id"></a> [inventory\_repo\_git\_id](#output\_inventory\_repo\_git\_id) | The inventory repository Git ID |
| <a name="output_inventory_repo_git_provider"></a> [inventory\_repo\_git\_provider](#output\_inventory\_repo\_git\_provider) | The inventory repository provider type. Can be 'hostedgit', 'githubconsolidated' etc. |
| <a name="output_inventory_repo_url"></a> [inventory\_repo\_url](#output\_inventory\_repo\_url) | The inventory repository instance URL, with details of which artifact has been built and will be deployed. |
| <a name="output_issues_repo"></a> [issues\_repo](#output\_issues\_repo) | The Issues repo. |
| <a name="output_issues_repo_git_id"></a> [issues\_repo\_git\_id](#output\_issues\_repo\_git\_id) | The issues repository Git ID |
| <a name="output_issues_repo_git_provider"></a> [issues\_repo\_git\_provider](#output\_issues\_repo\_git\_provider) | The issues repository provider type. Can be 'hostedgit', 'githubconsolidated' etc. |
| <a name="output_issues_repo_url"></a> [issues\_repo\_url](#output\_issues\_repo\_url) | The incident issues repository instance URL, where issues are created when vulnerabilities and CVEs are detected. |
| <a name="output_key_protect_instance_id"></a> [key\_protect\_instance\_id](#output\_key\_protect\_instance\_id) | The Key Protect instance ID. |
| <a name="output_pipeline_config_repo_git_id"></a> [pipeline\_config\_repo\_git\_id](#output\_pipeline\_config\_repo\_git\_id) | The compliance pipeline repository Git ID |
| <a name="output_pipeline_config_repo_git_provider"></a> [pipeline\_config\_repo\_git\_provider](#output\_pipeline\_config\_repo\_git\_provider) | The compliance pipeline repository provider type. Can be 'hostedgit', 'githubconsolidated' etc. |
| <a name="output_pipeline_config_repo_url"></a> [pipeline\_config\_repo\_url](#output\_pipeline\_config\_repo\_url) | This repository URL contains the tekton definitions for compliance pipelines. |
| <a name="output_pipeline_repo_url"></a> [pipeline\_repo\_url](#output\_pipeline\_repo\_url) | This repository URL contains the tekton definitions for compliance pipelines. |
| <a name="output_secret_tool"></a> [secret\_tool](#output\_secret\_tool) | The secret tool. |
| <a name="output_secret_tool_v1"></a> [secret\_tool\_v1](#output\_secret\_tool\_v1) | The legacy secret tool. Used as part of secret references to point to the secret tool integration. This is the legacy version of the secrets tool. The new version was updated to support using different secret groups with Secrests Manager. This only effects Secrets Manager. The net difference is that the legacy secret tool returns the tool name and the secret group name whereas the new tool returns only the tool name. |
| <a name="output_secrets_manager_instance_id"></a> [secrets\_manager\_instance\_id](#output\_secrets\_manager\_instance\_id) | The Secrets Manager instance ID. |
| <a name="output_toolchain_id"></a> [toolchain\_id](#output\_toolchain\_id) | The CD toolchain ID. |
| <a name="output_toolchain_url"></a> [toolchain\_url](#output\_toolchain\_url) | The CD toolchain URL. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Additional Information
## Locking Pipeline properties
- To make a variable locked, we need to provide the locked key as true for that variable.</br>
Example
```
  {
    "name": "example_variable",
    "type": "text",
    "value": "example_data",
    "locked": "true"
  }
```
The variable `example_variable` is locked by providing `locked` to `true`.If you want to unlock it, provide `locked` to `false`.
- Pipeline properties that are locked by default are stored in `default_locked_properties`.
- Overriding of pipeline properties
  - The code will first check if the locked key provides any value. If it is set, then it will take that value.
  - If no locked value is provided for the variable, it will check if it is inside the default set of locked property `default_locked_properties`.
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
