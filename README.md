<!-- BEGIN MODULE HOOK -->

<!-- Update the title to match the module name and add a description -->
## Terraform IBM DevSecOps CD Toolchain
<!-- UPDATE BADGE: Update the link for the following badge-->

A Terraform module for provisioning the DevSecOps CD toolchain.

<!-- Remove the content in this H2 heading after completing the steps -->
<!-- Remove the content in this previous H2 heading -->


<!-- END EXAMPLES HOOK -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.60.0, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_change_management_repo"></a> [change\_management\_repo](#module\_change\_management\_repo) | ./repos | n/a |
| <a name="module_compliance_pipelines_repo"></a> [compliance\_pipelines\_repo](#module\_compliance\_pipelines\_repo) | ./repos | n/a |
| <a name="module_deployment_repo"></a> [deployment\_repo](#module\_deployment\_repo) | ./repos | n/a |
| <a name="module_evidence_repo"></a> [evidence\_repo](#module\_evidence\_repo) | ./repos | n/a |
| <a name="module_integrations"></a> [integrations](#module\_integrations) | ./integrations | n/a |
| <a name="module_inventory_repo"></a> [inventory\_repo](#module\_inventory\_repo) | ./repos | n/a |
| <a name="module_issues_repo"></a> [issues\_repo](#module\_issues\_repo) | ./repos | n/a |
| <a name="module_pipeline_cd"></a> [pipeline\_cd](#module\_pipeline\_cd) | ./pipeline-cd | n/a |
| <a name="module_pipeline_config_repo"></a> [pipeline\_config\_repo](#module\_pipeline\_config\_repo) | ./repos | n/a |
| <a name="module_services"></a> [services](#module\_services) | ./services | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_cd_toolchain.toolchain_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.60.0/docs/resources/cd_toolchain) | resource |
| [ibm_cd_toolchain_tool_pipeline.cd_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.60.0/docs/resources/cd_toolchain_tool_pipeline) | resource |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.60.0/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_version"></a> [app\_version](#input\_app\_version) | The version of the app to deploy. | `string` | `"v1"` | no |
| <a name="input_artifact_signature_verification"></a> [artifact\_signature\_verification](#input\_artifact\_signature\_verification) | Set to `1` to enable artifact signature verification. | `string` | `""` | no |
| <a name="input_artifactory_dashboard_url"></a> [artifactory\_dashboard\_url](#input\_artifactory\_dashboard\_url) | Type the URL that you want to navigate to when you click the Artifactory integration tile. | `string` | `""` | no |
| <a name="input_artifactory_repo_name"></a> [artifactory\_repo\_name](#input\_artifactory\_repo\_name) | Type the name of your Artifactory repository where your docker images are located. | `string` | `"wcp-compliance-automation-team-docker-local"` | no |
| <a name="input_artifactory_repo_url"></a> [artifactory\_repo\_url](#input\_artifactory\_repo\_url) | Type the URL for your Artifactory release repository. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_crn"></a> [artifactory\_token\_secret\_crn](#input\_artifactory\_token\_secret\_crn) | The CRN for the Artifactory secret. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_group"></a> [artifactory\_token\_secret\_group](#input\_artifactory\_token\_secret\_group) | Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_name"></a> [artifactory\_token\_secret\_name](#input\_artifactory\_token\_secret\_name) | Name of the artifactory token secret in the secret provider. | `string` | `"artifactory-token"` | no |
| <a name="input_artifactory_user"></a> [artifactory\_user](#input\_artifactory\_user) | Type the User ID or email for your Artifactory repository. | `string` | `""` | no |
| <a name="input_authorization_policy_creation"></a> [authorization\_policy\_creation](#input\_authorization\_policy\_creation) | Set to disabled if you do not want this policy auto created. | `string` | `""` | no |
| <a name="input_change_management_group"></a> [change\_management\_group](#input\_change\_management\_group) | Specify Git user/group for change management repo. | `string` | `""` | no |
| <a name="input_change_management_repo_auth_type"></a> [change\_management\_repo\_auth\_type](#input\_change\_management\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_change_management_repo_git_id"></a> [change\_management\_repo\_git\_id](#input\_change\_management\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_change_management_repo_git_provider"></a> [change\_management\_repo\_git\_provider](#input\_change\_management\_repo\_git\_provider) | Choose the default git provider for change management repo | `string` | `"hostedgit"` | no |
| <a name="input_change_management_repo_git_token_secret_crn"></a> [change\_management\_repo\_git\_token\_secret\_crn](#input\_change\_management\_repo\_git\_token\_secret\_crn) | The CRN for the Change Managemenrt repository Git Token. | `string` | `""` | no |
| <a name="input_change_management_repo_git_token_secret_name"></a> [change\_management\_repo\_git\_token\_secret\_name](#input\_change\_management\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_change_management_repo_initialization_type"></a> [change\_management\_repo\_initialization\_type](#input\_change\_management\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_change_management_repo_integration_owner"></a> [change\_management\_repo\_integration\_owner](#input\_change\_management\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_change_management_repo_is_private_repo"></a> [change\_management\_repo\_is\_private\_repo](#input\_change\_management\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_change_management_repo_issues_enabled"></a> [change\_management\_repo\_issues\_enabled](#input\_change\_management\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `true` | no |
| <a name="input_change_management_repo_name"></a> [change\_management\_repo\_name](#input\_change\_management\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_change_management_repo_secret_group"></a> [change\_management\_repo\_secret\_group](#input\_change\_management\_repo\_secret\_group) | Secret group prefix for the Change Management repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_change_management_repo_traceability_enabled"></a> [change\_management\_repo\_traceability\_enabled](#input\_change\_management\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_change_repo_clone_from_url"></a> [change\_repo\_clone\_from\_url](#input\_change\_repo\_clone\_from\_url) | Override the default management repo , which will be cloned into the app repo. Note, using clone\_if\_not\_exists mode, so if the app repo already exists the repo contents are unchanged. | `string` | `""` | no |
| <a name="input_change_request_id"></a> [change\_request\_id](#input\_change\_request\_id) | The ID of an open change request. If this parameter is set to 'notAvailable' by default, a change request is automatically created by the continuous deployment pipeline. | `string` | `"notAvailable"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kubernetes cluster where the application is deployed. | `string` | `"mycluster-free"` | no |
| <a name="input_cluster_namespace"></a> [cluster\_namespace](#input\_cluster\_namespace) | Namespace of the Kubernetes cluster where the application is deployed. | `string` | `"default"` | no |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | Region of the Kubernetes cluster where the application is deployed. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_code_engine_app_concurrency"></a> [code\_engine\_app\_concurrency](#input\_code\_engine\_app\_concurrency) | The maximum number of requests that can be processed concurrently per instance. | `string` | `"100"` | no |
| <a name="input_code_engine_app_deployment_timeout"></a> [code\_engine\_app\_deployment\_timeout](#input\_code\_engine\_app\_deployment\_timeout) | The maximum timeout for the application deployment. | `string` | `"300"` | no |
| <a name="input_code_engine_app_max_scale"></a> [code\_engine\_app\_max\_scale](#input\_code\_engine\_app\_max\_scale) | The maximum number of instances that can be used for this application. If you set this value to 0, the application scales as needed. The application scaling is limited only by the instances per the resource quota for the project of your application. | `string` | `"1"` | no |
| <a name="input_code_engine_app_min_scale"></a> [code\_engine\_app\_min\_scale](#input\_code\_engine\_app\_min\_scale) | The minimum number of instances that can be used for this application. This option is useful to ensure that no instances are running when not needed. | `string` | `"0"` | no |
| <a name="input_code_engine_app_port"></a> [code\_engine\_app\_port](#input\_code\_engine\_app\_port) | The port where the application listens. The format is `[NAME:]PORT`, where `[NAME:]` is optional. If `[NAME:]` is specified, valid values are `h2c`, or `http1`. When `[NAME:]` is not specified or is `http1`, the port uses `HTTP/1.1`. When `[NAME:]` is `h2c`, the port uses unencrypted `HTTP/2`. | `string` | `"8080"` | no |
| <a name="input_code_engine_app_visibility"></a> [code\_engine\_app\_visibility](#input\_code\_engine\_app\_visibility) | The visibility for the application. Valid values are public, private and project. Setting a visibility of public means that your app can receive requests from the public internet or from components within the Code Engine project. Setting a visibility of private means that your app is not accessible from the public internet and network access is only possible from other IBM Cloud using Virtual Private Endpoints (VPE) or Code Engine components that are running in the same project. Visibility can only be private if the project supports application private visibility. Setting a visibility of project means that your app is not accessible from the public internet and network access is only possible from other Code Engine components that are running in the same project. | `string` | `"public"` | no |
| <a name="input_code_engine_binding_resource_group"></a> [code\_engine\_binding\_resource\_group](#input\_code\_engine\_binding\_resource\_group) | The name of a resource group to use for authentication for the service bindings of the Code Engine project. A service ID is created with Operator and Manager roles for all services in this resource group. Use '*' to specify all resource groups in this account. | `string` | `""` | no |
| <a name="input_code_engine_cpu"></a> [code\_engine\_cpu](#input\_code\_engine\_cpu) | The amount of CPU set for the instance of the application or job. | `string` | `"0.25"` | no |
| <a name="input_code_engine_deployment_type"></a> [code\_engine\_deployment\_type](#input\_code\_engine\_deployment\_type) | type of Code Engine component to create/update as part of deployment. It can be either `application` or `job`. | `string` | `"application"` | no |
| <a name="input_code_engine_env_from_configmaps"></a> [code\_engine\_env\_from\_configmaps](#input\_code\_engine\_env\_from\_configmaps) | Semi-colon separated list of configmaps to set environment variables. | `string` | `""` | no |
| <a name="input_code_engine_env_from_secrets"></a> [code\_engine\_env\_from\_secrets](#input\_code\_engine\_env\_from\_secrets) | Semi-colon separated list of secrets to set environment variables. | `string` | `""` | no |
| <a name="input_code_engine_ephemeral_storage"></a> [code\_engine\_ephemeral\_storage](#input\_code\_engine\_ephemeral\_storage) | The amount of ephemeral storage to set for the instance of the application or for the runs of the job. Use M for megabytes or G for gigabytes. | `string` | `"0.4G"` | no |
| <a name="input_code_engine_job_instances"></a> [code\_engine\_job\_instances](#input\_code\_engine\_job\_instances) | Specifies the number of instances that are used for runs of the job. When you use this option, the system converts to array indices. For example, if you specify instances of 5, the system converts to array-indices of 0 - 4. This option can only be specified if the --array-indices option is not specified. The default value is 1. | `string` | `"1"` | no |
| <a name="input_code_engine_job_maxexecutiontime"></a> [code\_engine\_job\_maxexecutiontime](#input\_code\_engine\_job\_maxexecutiontime) | The maximum execution time in seconds for runs of the job. | `string` | `"7200"` | no |
| <a name="input_code_engine_job_retrylimit"></a> [code\_engine\_job\_retrylimit](#input\_code\_engine\_job\_retrylimit) | The number of times to rerun an instance of the job before the job is marked as failed. | `string` | `"3"` | no |
| <a name="input_code_engine_memory"></a> [code\_engine\_memory](#input\_code\_engine\_memory) | The amount of memory set for the instance of the application or job. Use M for megabytes or G for gigabytes. | `string` | `"0.5G"` | no |
| <a name="input_code_engine_project"></a> [code\_engine\_project](#input\_code\_engine\_project) | The name of the Code Engine project to use. Created if it does not exist. | `string` | `""` | no |
| <a name="input_code_engine_region"></a> [code\_engine\_region](#input\_code\_engine\_region) | The region to create/lookup for the Code Engine project. | `string` | `""` | no |
| <a name="input_code_engine_remove_refs"></a> [code\_engine\_remove\_refs](#input\_code\_engine\_remove\_refs) | Remove references to unspecified configuration resources (configmap/secret) references (pulled from env-from-configmaps, env-from-secrets along with auto-managed by CD). | `string` | `"false"` | no |
| <a name="input_code_engine_resource_group"></a> [code\_engine\_resource\_group](#input\_code\_engine\_resource\_group) | The resource group of the Code Engine project. | `string` | `""` | no |
| <a name="input_code_engine_service_bindings"></a> [code\_engine\_service\_bindings](#input\_code\_engine\_service\_bindings) | JSON array including service name(s) (as a simple JSON string. | `string` | `""` | no |
| <a name="input_code_signing_cert"></a> [code\_signing\_cert](#input\_code\_signing\_cert) | The base64 encoded GPG public key. Setting this will add the public signing cert to the pipeline properties. Alternatively see `enable_signing_validation` to store the cert in a Secrets provider . | `string` | `""` | no |
| <a name="input_code_signing_cert_secret_crn"></a> [code\_signing\_cert\_secret\_crn](#input\_code\_signing\_cert\_secret\_crn) | The CRN for the public signing key cert in the secrets provider. | `string` | `""` | no |
| <a name="input_code_signing_cert_secret_group"></a> [code\_signing\_cert\_secret\_group](#input\_code\_signing\_cert\_secret\_group) | Secret group prefix for the pipeline Public signing key cert secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_code_signing_cert_secret_name"></a> [code\_signing\_cert\_secret\_name](#input\_code\_signing\_cert\_secret\_name) | Use `code_signing_cert` instead as aligns more with DevSecOps docs. Public signing key does not need to be stored in a secrets provider.( Name of the public signing key secret in the secret provider). | `string` | `"code-signing-cert"` | no |
| <a name="input_compliance_base_image"></a> [compliance\_base\_image](#input\_compliance\_base\_image) | Pipeline baseimage to run most of the built-in pipeline code. | `string` | `""` | no |
| <a name="input_compliance_pipeline_group"></a> [compliance\_pipeline\_group](#input\_compliance\_pipeline\_group) | Specify Git user/group for compliance pipeline repo. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_auth_type"></a> [compliance\_pipeline\_repo\_auth\_type](#input\_compliance\_pipeline\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_compliance_pipeline_repo_git_provider"></a> [compliance\_pipeline\_repo\_git\_provider](#input\_compliance\_pipeline\_repo\_git\_provider) | Choose the default git provider for change management repo | `string` | `"hostedgit"` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_crn"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_crn](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_crn) | The CRN for the Compliance Pipeline repository Git Token. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_name"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_name](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_compliance_pipeline_repo_integration_owner"></a> [compliance\_pipeline\_repo\_integration\_owner](#input\_compliance\_pipeline\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_issues_enabled"></a> [compliance\_pipeline\_repo\_issues\_enabled](#input\_compliance\_pipeline\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_compliance_pipeline_repo_secret_group"></a> [compliance\_pipeline\_repo\_secret\_group](#input\_compliance\_pipeline\_repo\_secret\_group) | Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_url"></a> [compliance\_pipeline\_repo\_url](#input\_compliance\_pipeline\_repo\_url) | URL of pipeline repo template to be cloned. | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_git_id"></a> [compliance\_pipelines\_repo\_git\_id](#input\_compliance\_pipelines\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_crn"></a> [cos\_api\_key\_secret\_crn](#input\_cos\_api\_key\_secret\_crn) | The CRN for the Cloud Object Storage apikey. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_group"></a> [cos\_api\_key\_secret\_group](#input\_cos\_api\_key\_secret\_group) | Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_name"></a> [cos\_api\_key\_secret\_name](#input\_cos\_api\_key\_secret\_name) | Name of the IBM Cloud Storage api-key secret in the secret provider. | `string` | `"cos-api-key"` | no |
| <a name="input_cos_bucket_name"></a> [cos\_bucket\_name](#input\_cos\_bucket\_name) | COS bucket name. | `string` | `""` | no |
| <a name="input_cos_dashboard_url"></a> [cos\_dashboard\_url](#input\_cos\_dashboard\_url) | The dashboard URL for the COS toolcard. | `string` | `"https://cloud.ibm.com/catalog/services/cloud-object-storage"` | no |
| <a name="input_cos_endpoint"></a> [cos\_endpoint](#input\_cos\_endpoint) | COS endpoint name. | `string` | `""` | no |
| <a name="input_create_triggers"></a> [create\_triggers](#input\_create\_triggers) | Set to `true` to create all the default triggers. | `bool` | `true` | no |
| <a name="input_customer_impact"></a> [customer\_impact](#input\_customer\_impact) | Custom impact of the change request. | `string` | `"no_impact"` | no |
| <a name="input_default_git_provider"></a> [default\_git\_provider](#input\_default\_git\_provider) | Choose the default git provider for app repo | `string` | `"hostedgit"` | no |
| <a name="input_deployment_group"></a> [deployment\_group](#input\_deployment\_group) | Specify Git user/group for deployment repo. | `string` | `""` | no |
| <a name="input_deployment_repo_auth_type"></a> [deployment\_repo\_auth\_type](#input\_deployment\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat. | `string` | `"oauth"` | no |
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
| <a name="input_deployment_repo_secret_group"></a> [deployment\_repo\_secret\_group](#input\_deployment\_repo\_secret\_group) | Secret group prefix for the Deployment repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_deployment_repo_traceability_enabled"></a> [deployment\_repo\_traceability\_enabled](#input\_deployment\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_deployment_source_repo_url"></a> [deployment\_source\_repo\_url](#input\_deployment\_source\_repo\_url) | Url of deployment repo template | `string` | `""` | no |
| <a name="input_deployment_target"></a> [deployment\_target](#input\_deployment\_target) | The deployment target, 'cluster' or 'code-engine'. | `string` | `"cluster"` | no |
| <a name="input_doi_environment"></a> [doi\_environment](#input\_doi\_environment) | DevOpsInsights environment for DevSecOps CD deployment. | `string` | `""` | no |
| <a name="input_doi_toolchain_id"></a> [doi\_toolchain\_id](#input\_doi\_toolchain\_id) | DevOps Insights Toolchain ID to link to. | `string` | `""` | no |
| <a name="input_emergency_label"></a> [emergency\_label](#input\_emergency\_label) | Identifies the pull request as an emergency. | `string` | `"EMERGENCY"` | no |
| <a name="input_enable_artifactory"></a> [enable\_artifactory](#input\_enable\_artifactory) | Set true to enable artifacory for devsecops. | `bool` | `false` | no |
| <a name="input_enable_change_management_repo"></a> [enable\_change\_management\_repo](#input\_enable\_change\_management\_repo) | Set to `true` to enable the Change Management Repo integration. | `string` | `true` | no |
| <a name="input_enable_insights"></a> [enable\_insights](#input\_enable\_insights) | Set to `true` to enable the DevOps Insights integration. | `bool` | `true` | no |
| <a name="input_enable_key_protect"></a> [enable\_key\_protect](#input\_enable\_key\_protect) | Set to enable Key Protect Integration. | `bool` | `false` | no |
| <a name="input_enable_pipeline_git_token"></a> [enable\_pipeline\_git\_token](#input\_enable\_pipeline\_git\_token) | Enable to add `git-token` to the pipeline properties. | `bool` | `false` | no |
| <a name="input_enable_secrets_manager"></a> [enable\_secrets\_manager](#input\_enable\_secrets\_manager) | Set to enable Secrets Manager Integration. | `bool` | `true` | no |
| <a name="input_enable_signing_validation"></a> [enable\_signing\_validation](#input\_enable\_signing\_validation) | Enable for signing validation. Enabling this will expect the public signing cert to be in a Secrets Provider under a key called `code-signing-cert`. | `bool` | `false` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Set to true to create the integration. | `bool` | `false` | no |
| <a name="input_event_notifications_crn"></a> [event\_notifications\_crn](#input\_event\_notifications\_crn) | The CRN for the Event Notifications instance. | `string` | `""` | no |
| <a name="input_event_notifications_tool_name"></a> [event\_notifications\_tool\_name](#input\_event\_notifications\_tool\_name) | The name of the Event Notifications integration. | `string` | `"Event Notifications"` | no |
| <a name="input_evidence_group"></a> [evidence\_group](#input\_evidence\_group) | Specify Git user/group for evidence repo. | `string` | `""` | no |
| <a name="input_evidence_repo_auth_type"></a> [evidence\_repo\_auth\_type](#input\_evidence\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_evidence_repo_git_id"></a> [evidence\_repo\_git\_id](#input\_evidence\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_evidence_repo_git_provider"></a> [evidence\_repo\_git\_provider](#input\_evidence\_repo\_git\_provider) | Git provider for evidence repo | `string` | `"hostedgit"` | no |
| <a name="input_evidence_repo_git_token_secret_crn"></a> [evidence\_repo\_git\_token\_secret\_crn](#input\_evidence\_repo\_git\_token\_secret\_crn) | The CRN for the Evidence repository Git Token. | `string` | `""` | no |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence\_repo\_git\_token\_secret\_name](#input\_evidence\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_evidence_repo_initialization_type"></a> [evidence\_repo\_initialization\_type](#input\_evidence\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_evidence_repo_integration_owner"></a> [evidence\_repo\_integration\_owner](#input\_evidence\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_evidence_repo_is_private_repo"></a> [evidence\_repo\_is\_private\_repo](#input\_evidence\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_evidence_repo_issues_enabled"></a> [evidence\_repo\_issues\_enabled](#input\_evidence\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_evidence_repo_name"></a> [evidence\_repo\_name](#input\_evidence\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_evidence_repo_secret_group"></a> [evidence\_repo\_secret\_group](#input\_evidence\_repo\_secret\_group) | Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_evidence_repo_traceability_enabled"></a> [evidence\_repo\_traceability\_enabled](#input\_evidence\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_evidence_repo_url"></a> [evidence\_repo\_url](#input\_evidence\_repo\_url) | This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates. | `string` | n/a | yes |
| <a name="input_force_redeploy"></a> [force\_redeploy](#input\_force\_redeploy) | Forces the deployment or redeployment of the app even if the last deployment does not contain a delta in the inventory. Set this parameter to `true` to force a deployment of the app as if it is the first deployment on the specified target environment. By default, this parameter is set to `false`. | `string` | `"false"` | no |
| <a name="input_ibmcloud_api"></a> [ibmcloud\_api](#input\_ibmcloud\_api) | IBM Cloud API Endpoint. | `string` | `"https://cloud.ibm.com"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key used to create the toolchains. | `string` | n/a | yes |
| <a name="input_inventory_group"></a> [inventory\_group](#input\_inventory\_group) | Specify Git user/group for inventory repo. | `string` | `""` | no |
| <a name="input_inventory_repo_auth_type"></a> [inventory\_repo\_auth\_type](#input\_inventory\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_inventory_repo_git_id"></a> [inventory\_repo\_git\_id](#input\_inventory\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_inventory_repo_git_provider"></a> [inventory\_repo\_git\_provider](#input\_inventory\_repo\_git\_provider) | Git provider for inventory repo | `string` | `"hostedgit"` | no |
| <a name="input_inventory_repo_git_token_secret_crn"></a> [inventory\_repo\_git\_token\_secret\_crn](#input\_inventory\_repo\_git\_token\_secret\_crn) | The CRN for the Inventory repository Git Token. | `string` | `""` | no |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory\_repo\_git\_token\_secret\_name](#input\_inventory\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_inventory_repo_initialization_type"></a> [inventory\_repo\_initialization\_type](#input\_inventory\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_inventory_repo_integration_owner"></a> [inventory\_repo\_integration\_owner](#input\_inventory\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_inventory_repo_is_private_repo"></a> [inventory\_repo\_is\_private\_repo](#input\_inventory\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_inventory_repo_issues_enabled"></a> [inventory\_repo\_issues\_enabled](#input\_inventory\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_inventory_repo_name"></a> [inventory\_repo\_name](#input\_inventory\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_inventory_repo_secret_group"></a> [inventory\_repo\_secret\_group](#input\_inventory\_repo\_secret\_group) | Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_inventory_repo_traceability_enabled"></a> [inventory\_repo\_traceability\_enabled](#input\_inventory\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_inventory_repo_url"></a> [inventory\_repo\_url](#input\_inventory\_repo\_url) | This is a template repository to clone compliance-inventory-locker for reference DevSecOps toolchain templates. | `string` | n/a | yes |
| <a name="input_issues_group"></a> [issues\_group](#input\_issues\_group) | Specify Git user/group for issues repo. | `string` | `""` | no |
| <a name="input_issues_repo_auth_type"></a> [issues\_repo\_auth\_type](#input\_issues\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
| <a name="input_issues_repo_git_id"></a> [issues\_repo\_git\_id](#input\_issues\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_issues_repo_git_provider"></a> [issues\_repo\_git\_provider](#input\_issues\_repo\_git\_provider) | Git provider for issue repo | `string` | `"hostedgit"` | no |
| <a name="input_issues_repo_git_token_secret_crn"></a> [issues\_repo\_git\_token\_secret\_crn](#input\_issues\_repo\_git\_token\_secret\_crn) | The CRN for the Issues repository Git Token. | `string` | `""` | no |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues\_repo\_git\_token\_secret\_name](#input\_issues\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_issues_repo_initialization_type"></a> [issues\_repo\_initialization\_type](#input\_issues\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_issues_repo_integration_owner"></a> [issues\_repo\_integration\_owner](#input\_issues\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_issues_repo_is_private_repo"></a> [issues\_repo\_is\_private\_repo](#input\_issues\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_issues_repo_issues_enabled"></a> [issues\_repo\_issues\_enabled](#input\_issues\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `true` | no |
| <a name="input_issues_repo_name"></a> [issues\_repo\_name](#input\_issues\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_issues_repo_secret_group"></a> [issues\_repo\_secret\_group](#input\_issues\_repo\_secret\_group) | Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_issues_repo_traceability_enabled"></a> [issues\_repo\_traceability\_enabled](#input\_issues\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_issues_repo_url"></a> [issues\_repo\_url](#input\_issues\_repo\_url) | This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates. | `string` | n/a | yes |
| <a name="input_kp_integration_name"></a> [kp\_integration\_name](#input\_kp\_integration\_name) | The name of the Key Protect integration. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_location"></a> [kp\_location](#input\_kp\_location) | IBM Cloud location/region containing the Key Protect instance. | `string` | `"us-south"` | no |
| <a name="input_kp_name"></a> [kp\_name](#input\_kp\_name) | Name of the Key Protect instance where the secrets are stored. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_resource_group"></a> [kp\_resource\_group](#input\_kp\_resource\_group) | The resource group containing the Key Protect instance. | `string` | `"Default"` | no |
| <a name="input_link_to_doi_toolchain"></a> [link\_to\_doi\_toolchain](#input\_link\_to\_doi\_toolchain) | Enable a link to a DevOpsInsights instance in another toolchain, true or false. | `bool` | `false` | no |
| <a name="input_merge_cra_sbom"></a> [merge\_cra\_sbom](#input\_merge\_cra\_sbom) | Merge the SBOM. | `string` | `"1"` | no |
| <a name="input_peer_review_collection"></a> [peer\_review\_collection](#input\_peer\_review\_collection) | Set to `1` to enable peer review collection. | `string` | `""` | no |
| <a name="input_peer_review_compliance"></a> [peer\_review\_compliance](#input\_peer\_review\_compliance) | Set to `1` to enable peer review compliance validation. | `string` | `"1"` | no |
| <a name="input_pipeline_branch"></a> [pipeline\_branch](#input\_pipeline\_branch) | The branch within pipeline definitions repository for Compliance CD Toolchain. | `string` | `"open-v10"` | no |
| <a name="input_pipeline_config_group"></a> [pipeline\_config\_group](#input\_pipeline\_config\_group) | Specify Git user/group for pipeline config repo. | `string` | `""` | no |
| <a name="input_pipeline_config_path"></a> [pipeline\_config\_path](#input\_pipeline\_config\_path) | The name and path of the pipeline-config.yaml file within the pipeline-config repo. | `string` | `".pipeline-config.yaml"` | no |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline\_config\_repo\_auth\_type](#input\_pipeline\_config\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'. | `string` | `"oauth"` | no |
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
| <a name="input_pipeline_config_repo_secret_group"></a> [pipeline\_config\_repo\_secret\_group](#input\_pipeline\_config\_repo\_secret\_group) | Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_traceability_enabled"></a> [pipeline\_config\_repo\_traceability\_enabled](#input\_pipeline\_config\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_pipeline_debug"></a> [pipeline\_debug](#input\_pipeline\_debug) | Set to '1' to enable debug logging. | `string` | `"0"` | no |
| <a name="input_pipeline_doi_api_key_secret_crn"></a> [pipeline\_doi\_api\_key\_secret\_crn](#input\_pipeline\_doi\_api\_key\_secret\_crn) | The CRN for the DOI apikey. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_group"></a> [pipeline\_doi\_api\_key\_secret\_group](#input\_pipeline\_doi\_api\_key\_secret\_group) | Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_name"></a> [pipeline\_doi\_api\_key\_secret\_name](#input\_pipeline\_doi\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance. | `string` | `""` | no |
| <a name="input_pipeline_git_tag"></a> [pipeline\_git\_tag](#input\_pipeline\_git\_tag) | The GIT tag within the pipeline definitions repository for Compliance CD Toolchain. | `string` | `""` | no |
| <a name="input_pipeline_git_token_secret_crn"></a> [pipeline\_git\_token\_secret\_crn](#input\_pipeline\_git\_token\_secret\_crn) | The CRN for the Git Token secret in the pipeline properties. | `string` | `""` | no |
| <a name="input_pipeline_git_token_secret_group"></a> [pipeline\_git\_token\_secret\_group](#input\_pipeline\_git\_token\_secret\_group) | Secret group prefix for the pipeline Git token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_git_token_secret_name"></a> [pipeline\_git\_token\_secret\_name](#input\_pipeline\_git\_token\_secret\_name) | Name of the pipeline Git token secret in the secret provider. | `string` | `"pipeline-git-token"` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_crn"></a> [pipeline\_ibmcloud\_api\_key\_secret\_crn](#input\_pipeline\_ibmcloud\_api\_key\_secret\_crn) | The CRN for the pipeline apikey. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_group"></a> [pipeline\_ibmcloud\_api\_key\_secret\_group](#input\_pipeline\_ibmcloud\_api\_key\_secret\_group) | Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline\_ibmcloud\_api\_key\_secret\_name](#input\_pipeline\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_privateworker_credentials_secret_crn"></a> [privateworker\_credentials\_secret\_crn](#input\_privateworker\_credentials\_secret\_crn) | The CRN for the Private Worker apikey. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_group"></a> [privateworker\_credentials\_secret\_group](#input\_privateworker\_credentials\_secret\_group) | Secret group prefix for the Private Worker secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_name"></a> [privateworker\_credentials\_secret\_name](#input\_privateworker\_credentials\_secret\_name) | Name of the privateworker secret in the secret provider. | `string` | `"private-worker-service-api"` | no |
| <a name="input_region"></a> [region](#input\_region) | IBM Cloud region used to prefix the `prod_latest` inventory repo branch. | `string` | `""` | no |
| <a name="input_repositories_prefix"></a> [repositories\_prefix](#input\_repositories\_prefix) | Prefix name for the cloned compliance repos. | `string` | `"compliance"` | no |
| <a name="input_satellite_cluster_group"></a> [satellite\_cluster\_group](#input\_satellite\_cluster\_group) | The Satellite cluster group. | `string` | `""` | no |
| <a name="input_scc_attachment_id"></a> [scc\_attachment\_id](#input\_scc\_attachment\_id) | An attachment ID. An attachment is configured under a profile to define how a scan will be run. To find the attachment ID, in the browser, in the attachments list, click on the attachment link, and a panel appears with a button to copy the attachment ID. This parameter is only relevant when the `scc_use_profile_attachment` parameter is enabled. | `string` | `""` | no |
| <a name="input_scc_enable_scc"></a> [scc\_enable\_scc](#input\_scc\_enable\_scc) | Enable the SCC integration. | `bool` | `true` | no |
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
| <a name="input_slack_notifications"></a> [slack\_notifications](#input\_slack\_notifications) | The switch that turns the Slack integration on or off. | `string` | `"0"` | no |
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
| <a name="input_source_environment"></a> [source\_environment](#input\_source\_environment) | The source environment that the app is promoted from. | `string` | `"master"` | no |
| <a name="input_target_environment"></a> [target\_environment](#input\_target\_environment) | The target environment that the app is deployed to. | `string` | `"prod"` | no |
| <a name="input_target_environment_detail"></a> [target\_environment\_detail](#input\_target\_environment\_detail) | Details of the environment being updated. | `string` | `"Production target environment"` | no |
| <a name="input_target_environment_purpose"></a> [target\_environment\_purpose](#input\_target\_environment\_purpose) | Purpose of the environment being updated. | `string` | `"production"` | no |
| <a name="input_toolchain_description"></a> [toolchain\_description](#input\_toolchain\_description) | Description for the CD oolchain. | `string` | `"Toolchain created with Terraform template for DevSecOps CD Best Practices"` | no |
| <a name="input_toolchain_name"></a> [toolchain\_name](#input\_toolchain\_name) | Name of CD the Toolchain. | `string` | `"DevSecOps CD Toolchain - Terraform"` | no |
| <a name="input_toolchain_region"></a> [toolchain\_region](#input\_toolchain\_region) | IBM Cloud Region for the toolchain. | `string` | `"us-south"` | no |
| <a name="input_toolchain_resource_group"></a> [toolchain\_resource\_group](#input\_toolchain\_resource\_group) | The resource group within which the toolchain is created. | `string` | `"Default"` | no |
| <a name="input_trigger_git_enable"></a> [trigger\_git\_enable](#input\_trigger\_git\_enable) | Set to `true` to enable the CD pipeline Git trigger. | `bool` | `false` | no |
| <a name="input_trigger_git_name"></a> [trigger\_git\_name](#input\_trigger\_git\_name) | The name of the CD pipeline GIT trigger. | `string` | `"Git CD Trigger"` | no |
| <a name="input_trigger_git_promotion_branch"></a> [trigger\_git\_promotion\_branch](#input\_trigger\_git\_promotion\_branch) | Branch for Git promotion listener. | `string` | `"prod"` | no |
| <a name="input_trigger_git_promotion_enable"></a> [trigger\_git\_promotion\_enable](#input\_trigger\_git\_promotion\_enable) | Enable Git promotion for Git promotion listener. | `bool` | `false` | no |
| <a name="input_trigger_git_promotion_listener"></a> [trigger\_git\_promotion\_listener](#input\_trigger\_git\_promotion\_listener) | Select a Tekton EventListener to use when Git promotion listener trigger is fired. | `string` | `"promotion-validation-listener-gitlab"` | no |
| <a name="input_trigger_manual_enable"></a> [trigger\_manual\_enable](#input\_trigger\_manual\_enable) | Set to `true` to enable the CD pipeline Manual trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_name"></a> [trigger\_manual\_name](#input\_trigger\_manual\_name) | The name of the CI pipeline Manual trigger. | `string` | `"Manual CD Trigger"` | no |
| <a name="input_trigger_manual_promotion_enable"></a> [trigger\_manual\_promotion\_enable](#input\_trigger\_manual\_promotion\_enable) | Set to `true` to enable the CD pipeline Manual Promotion trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_promotion_name"></a> [trigger\_manual\_promotion\_name](#input\_trigger\_manual\_promotion\_name) | The name of the CD pipeline Manual Promotion trigger. | `string` | `"Manual Promotion Trigger"` | no |
| <a name="input_trigger_manual_pruner_enable"></a> [trigger\_manual\_pruner\_enable](#input\_trigger\_manual\_pruner\_enable) | Set to `true` to enable the manual Pruner trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_pruner_name"></a> [trigger\_manual\_pruner\_name](#input\_trigger\_manual\_pruner\_name) | The name of the manual Pruner trigger. | `string` | `"Evidence Pruner Manual Trigger"` | no |
| <a name="input_trigger_timed_cron_schedule"></a> [trigger\_timed\_cron\_schedule](#input\_trigger\_timed\_cron\_schedule) | Only needed for timed triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *\_/2 * * * - every 2 hours. | `string` | `"0 4 * * *"` | no |
| <a name="input_trigger_timed_enable"></a> [trigger\_timed\_enable](#input\_trigger\_timed\_enable) | Set to `true` to enable the CD pipeline Timed trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_name"></a> [trigger\_timed\_name](#input\_trigger\_timed\_name) | The name of the CD pipeline Timed trigger. | `string` | `"Git CD Timed Trigger"` | no |
| <a name="input_trigger_timed_pruner_enable"></a> [trigger\_timed\_pruner\_enable](#input\_trigger\_timed\_pruner\_enable) | Set to `true` to enable the timed Pruner trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_pruner_name"></a> [trigger\_timed\_pruner\_name](#input\_trigger\_timed\_pruner\_name) | The name of the timed Pruner trigger. | `string` | `"Evidence Pruner Timed Trigger"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cd_pipeline_id"></a> [cd\_pipeline\_id](#output\_cd\_pipeline\_id) | The CD pipeline ID. |
| <a name="output_change_management_repo"></a> [change\_management\_repo](#output\_change\_management\_repo) | The Change Management repository. |
| <a name="output_change_management_repo_url"></a> [change\_management\_repo\_url](#output\_change\_management\_repo\_url) | The change management repository instance URL. |
| <a name="output_deployment_repo_url"></a> [deployment\_repo\_url](#output\_deployment\_repo\_url) | The deployment repo URL. |
| <a name="output_evidence_repo"></a> [evidence\_repo](#output\_evidence\_repo) | The Evidence repo. |
| <a name="output_evidence_repo_url"></a> [evidence\_repo\_url](#output\_evidence\_repo\_url) | The evidence repository instance URL, where evidence of the builds and scans are stored, ready for any compliance audit. |
| <a name="output_inventory_repo"></a> [inventory\_repo](#output\_inventory\_repo) | The Inventory repo. |
| <a name="output_inventory_repo_url"></a> [inventory\_repo\_url](#output\_inventory\_repo\_url) | The inventory repository instance URL, with details of which artifact has been built and will be deployed. |
| <a name="output_issues_repo"></a> [issues\_repo](#output\_issues\_repo) | The Issues repo. |
| <a name="output_issues_repo_url"></a> [issues\_repo\_url](#output\_issues\_repo\_url) | The incident issues repository instance URL, where issues are created when vulnerabilities and CVEs are detected. |
| <a name="output_key_protect_instance_id"></a> [key\_protect\_instance\_id](#output\_key\_protect\_instance\_id) | The Key Protect instance ID. |
| <a name="output_pipeline_repo_url"></a> [pipeline\_repo\_url](#output\_pipeline\_repo\_url) | This repository URL contains the tekton definitions for compliance pipelines. |
| <a name="output_secret_tool"></a> [secret\_tool](#output\_secret\_tool) | The secret tool. |
| <a name="output_secret_tool_v1"></a> [secret\_tool\_v1](#output\_secret\_tool\_v1) | The legacy secret tool. Used as part of secret references to point to the secret tool integration. This is the legacy version of the secrets tool. The new version was updated to support using different secret groups with Secrests Manager. This only effects Secrets Manager. The net difference is that the legacy secret tool returns the tool name and the secret group name whereas the new tool returns only the tool name. |
| <a name="output_secrets_manager_instance_id"></a> [secrets\_manager\_instance\_id](#output\_secrets\_manager\_instance\_id) | The Secrets Manager instance ID. |
| <a name="output_toolchain_id"></a> [toolchain\_id](#output\_toolchain\_id) | The CD toolchain ID. |
| <a name="output_toolchain_url"></a> [toolchain\_url](#output\_toolchain\_url) | The CD toolchain URL. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
