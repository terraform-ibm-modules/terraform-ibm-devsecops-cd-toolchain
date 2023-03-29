
# Terraform IBM DevSecOps CD Toolchain

## Setup Terraform

#### Terraform CLI Installation
The Terraform CLI is a command line application from HashiCorp that is required to run the different Terraform commands.
##### MacOS
Run the following to install the Hashicorp repository of Homebrew packages
- brew tap hashicorp/tap

- brew install hashicorp/tap/terraform

##### RHEL/yum
- sudo yum install -y yum-utils
- sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/$release/hashicorp.repo

- yum install terraform

##### Ubuntu
- sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

- wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

- gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

- echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

- sudo apt update

- sudo apt-get install terraform

##### Verify Installation
Run `terraform -help`

##### Other Platforms
For additional platforms please see https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### Terraform Commands (basic)
1. `terraform init` - this command initialises the working directory containing the Terraform configuration files
2. `terraform plan` - a command that provides a preview of the actions that Terraform will perform on your infrastructure.
3. `terraform apply` - the command to perform the infrastructure modifications outlined using the plan command.
4. `terraform destroy` - the command to delete all the resources managed by the Terraform project.
5. `terraform help` - lists and describes Terraform CLI commands

## Usage

Before beginning see the [Prerequisites](#prerequisites) and [Required IAM access policies](#iamaccess) sections

### Setup
The following steps create the out of the box setup for the CC Toolchains. Read through the example .tfvars file for a quick set up and see the [inputs](#inputs) for all modifiable settings. 

- Clone this [repo](https://github.com/terraform-ibm-modules/terraform-ibm-devsecops-alm) to a local directory
- `cd` into the cloned directory
- Run `terraform init` to download the required modules and plugins
- Supply a `terraform.tfvars` file with the required variables. See the provided example at the root of the repo
- Rename the `variables.tfvars.example` to `variables.tfvars.example`
- The snippet below shows the minumum required details to set up the CD toolchain. Read the notes in the sample tfvars file for more details
- Run `terraform plan -var-files 'path-to-variables.tfvars'` to generate a plan and check to for potential problems
- Run `terraform apply -var-files 'path-to-variables.tfvars'` to execute the Terraform commands

After a successful Terraform run, login into [IBM Cloud](https://cloud.ibm.com/) and look at the [Toolchains](https://cloud.ibm.com/devops/toolchains?env_id=ibm:yp:us-south) section to find your newly created DevSecOps toolchains.

```hcl
ibmcloud_api_key          = "{set your ibmcloud apikey}"
toolchain_region          = "us-south"
toolchain_name            = "DevSecOps CD Toolchain - Terraform"
pipeline_repo             = "https://us-south.git.cloud.ibm.com/open-toolchain/compliance-pipelines"
evidence_repo_url         = "https://us-south.git.cloud.ibm.com/{namespace}/{evidence_repo}"
inventory_repo_url        = "https://us-south.git.cloud.ibm.com/{namespace}/{inventory_repo}"
issues_repo_url           = "https://us-south.git.cloud.ibm.com/{namespace}/{issues_repo}"
registry_namespace        = "my-namespace"
cluster_name              = "mycluster-free"
cluster_namespace         = "default"
cluster_region            = "ibm:yp:us-south"
sm_name                   = "sm-compliance-secrets"
sm_location               = "eu-gb"
sm_resource_group         = "Default"
sm_secret_group           = "Default"
```

### <a id="prerequisites"></a>Prerequisites

#### IBM Cloud account

Set up an [IBM Cloud account](https://cloud.ibm.com/registration). Depending on your IBM Cloud account type, access to certain resources might be limited. Depending on your account plan limits, certain capabilities that are required by some DevSecOps toolchains might not be available. For more information, see [Setting up your IBM Cloud account](https://cloud.ibm.com/docs/account?topic=account-account-getting-started) and [Upgrading your account](https://cloud.ibm.com/docs/account?topic=account-upgrading-account).

#### Secrets Management Vault

Ensure that all of the secret values that you need are stored in a secrets management vault. [Managing IBM Cloud secrets](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-manage-secrets-ibm-cloud) can help you to choose from various secrets management and data protection offerings. If you don't already have an instance of the secrets management vault provider of your choice, create one. For information about IBM Cloud® Secrets Manager, see [Getting started with Secrets Manager](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-getting-started).

#### Kubernetes cluster

Create a [Kubernetes cluster](https://cloud.ibm.com/kubernetes/catalog/cluster/create). While you are evaluating the service, you can use the Free pricing plan. The cluster might take some time to provision. As the cluster is created, it progresses through these stages: Deploying, Pending, and Ready. [Learn more](https://cloud.ibm.com/docs/Registry?topic=Registry-getting-started).

#### Container Registry namespace

Create an [IBM Cloud® Container Registry namespace](https://cloud.ibm.com/registry/namespaces). IBM Cloud Container Registry provides a multi-tenant private image registry that you can use to store and share your container images with users in your IBM Cloud account. Select the location for your namespace, and click Create. [Learn more](https://cloud.ibm.com/docs/Registry?topic=Registry-getting-started).

#### IBM Cloud API key
Create an [IBM Cloud API key](https://cloud.ibm.com/iam/apikeys). Save the API key value by either copying, downloading it or adding it to your vault.

#### IBM Cloud Object Storage (Optional)
Create an [IBM Cloud Object Storage instance and bucket](https://cloud.ibm.com/docs/devsecops?topic=devsecops-cd-devsecops-cos-config). [Learn more](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-about-cloud-object-storage).




## <a id="iamaccess"></a>Required IAM access policies

You need the following permissions to run this module.

- Account Management
    - IAM Services
        | Platform Roles | Description of actions |
|------|---------|
|Viewer	|View toolchains and delivery pipelines.|
|Operator |	Run toolchains and delivery pipelines.|
|Editor	|Manage the toolchains, which include creating and deleting toolchains along with performing all platform actions except for managing the account and assigning access policies.|
|Administrator|	Perform all platform actions based on the resource this role is being assigned, including assigning access policies to other users.|

        | Service Roles | Description of actions |
|------|---------|
|Administrator, Writer	| The IBM Cloud Object Storage service in your team's resource group.|
|Administrator, Writer	| The IBM Cloud® Continuous Delivery service in your team's resource group.|
|Administrator	| The toolchain service in your team's resource group.|
|Viewer, Reader, Writer	| The IBM Cloud® Kubernetes Service.|
|Viewer, ReaderPlus	| The Key Protect service in your team's resource group.|
|Viewer, SecretsReader |	The Secrets Manager service in your team's resource group.|


## Examples

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >=1.51.0 |

## Modules


## Resources

No resources.

## <a id="inputs">Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_version"></a> [app\_version](#input\_app\_version) | The version of the app to deploy. | `string` | `"v1"` | no |
| <a name="input_authorization_policy_creation"></a> [authorization\_policy\_creation](#input\_authorization\_policy\_creation) | Disable Toolchain Service to Secrets Manager Service auhorization policy creation | `string` | `""` | no |
| <a name="input_change_management_group"></a> [change\_management\_group](#input\_change\_management\_group) | Specify group for change management repository | `string` | `""` | no |
| <a name="input_change_management_repo"></a> [change\_management\_repo](#input\_change\_management\_repo) | This repository holds the change management requests created for the deployments. | `string` | `""` | no |
| <a name="input_change_management_repo_auth_type"></a> [change\_management\_repo\_auth\_type](#input\_change\_management\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_change_management_repo_git_token_secret_name"></a> [change\_management\_repo\_git\_token\_secret\_name](#input\_change\_management\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_change_repo_clone_from_url"></a> [change\_repo\_clone\_from\_url](#input\_change\_repo\_clone\_from\_url) | Override the default management repo , which will be cloned into the app repo. Note, using clone\_if\_not\_exists mode, so if the app repo already exists the repo contents are unchanged. | `string` | `""` | no |
| <a name="input_change_request_id"></a> [change\_request\_id](#input\_change\_request\_id) | The ID of an open change request. If this parameter is set to 'notAvailable' by default, a change request is automatically created by the continuous deployment pipeline. | `string` | `"notAvailable"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the kubernetes cluster where the application will be deployed. | `string` | `"mycluster-free"` | no |
| <a name="input_cluster_namespace"></a> [cluster\_namespace](#input\_cluster\_namespace) | Name of the kubernetes cluster where the application will be deployed. | `string` | `"prod"` | no |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | Region of the kubernetes cluster where the application will be deployed. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_compliance_base_image"></a> [compliance\_base\_image](#input\_compliance\_base\_image) | Pipeline baseimage to run most of the built-in pipeline code | `string` | `""` | no |
| <a name="input_compliance_pipeline_group"></a> [compliance\_pipeline\_group](#input\_compliance\_pipeline\_group) | Specify user/group for compliance pipline repo | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_auth_type"></a> [compliance\_pipeline\_repo\_auth\_type](#input\_compliance\_pipeline\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_name"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_name](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_cos_api_key_secret_name"></a> [cos\_api\_key\_secret\_name](#input\_cos\_api\_key\_secret\_name) | Name of the cos api key secret in the secret provider. | `string` | `"cos-api-key"` | no |
| <a name="input_cos_bucket_name"></a> [cos\_bucket\_name](#input\_cos\_bucket\_name) | cos bucket name | `string` | `""` | no |
| <a name="input_cos_endpoint"></a> [cos\_endpoint](#input\_cos\_endpoint) | cos endpoint name | `string` | `""` | no |
| <a name="input_customer_impact"></a> [customer\_impact](#input\_customer\_impact) | Custom impact of the change request | `string` | `"no_impact"` | no |
| <a name="input_deployment_group"></a> [deployment\_group](#input\_deployment\_group) | Specify group for deployment | `string` | `""` | no |
| <a name="input_deployment_repo"></a> [deployment\_repo](#input\_deployment\_repo) | This repository contains scripts to perform deployment of a docker container for simple Node.js microservice using reference DevSecOps toolchain templates. | `string` | `""` | no |
| <a name="input_deployment_repo_auth_type"></a> [deployment\_repo\_auth\_type](#input\_deployment\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_deployment_repo_clone_from_branch"></a> [deployment\_repo\_clone\_from\_branch](#input\_deployment\_repo\_clone\_from\_branch) | Used when deployment\_repo\_clone\_from\_url is provided, the default branch that will be used by the CD build, usually either main or master. | `string` | `""` | no |
| <a name="input_deployment_repo_clone_from_url"></a> [deployment\_repo\_clone\_from\_url](#input\_deployment\_repo\_clone\_from\_url) | Override the default sample app by providing your own sample deployment url, which will be cloned into the app repo. Note, using clone\_if\_not\_exists mode, so if the app repo already exists the repo contents are unchanged. | `string` | `""` | no |
| <a name="input_deployment_repo_clone_to_git_id"></a> [deployment\_repo\_clone\_to\_git\_id](#input\_deployment\_repo\_clone\_to\_git\_id) | By default absent, else custom server GUID, or other options for 'git\_id' field in the browser UI. | `string` | `""` | no |
| <a name="input_deployment_repo_clone_to_git_provider"></a> [deployment\_repo\_clone\_to\_git\_provider](#input\_deployment\_repo\_clone\_to\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `""` | no |
| <a name="input_deployment_repo_existing_branch"></a> [deployment\_repo\_existing\_branch](#input\_deployment\_repo\_existing\_branch) | Used when deployment\_repo\_existing\_url is provided, the default branch that will be used by the CD build, usually either main or master. | `string` | `""` | no |
| <a name="input_deployment_repo_existing_git_id"></a> [deployment\_repo\_existing\_git\_id](#input\_deployment\_repo\_existing\_git\_id) | By default absent, else custom server GUID, or other options for 'git\_id' field in the browser UI. | `string` | `""` | no |
| <a name="input_deployment_repo_existing_git_provider"></a> [deployment\_repo\_existing\_git\_provider](#input\_deployment\_repo\_existing\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `"hostedgit"` | no |
| <a name="input_deployment_repo_existing_url"></a> [deployment\_repo\_existing\_url](#input\_deployment\_repo\_existing\_url) | Override to bring your own existing deployment repository URL, which will be used directly instead of cloning the default deployment sample. | `string` | `""` | no |
| <a name="input_deployment_repo_git_token_secret_name"></a> [deployment\_repo\_git\_token\_secret\_name](#input\_deployment\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_doi_environment"></a> [doi\_environment](#input\_doi\_environment) | DevOpsInsights environment for DevSecOps CD deployment | `string` | `""` | no |
| <a name="input_doi_toolchain_id"></a> [doi\_toolchain\_id](#input\_doi\_toolchain\_id) | DevOpsInsights Toolchain ID to link to | `string` | `""` | no |
| <a name="input_emergency_label"></a> [emergency\_label](#input\_emergency\_label) | Identifies the pull request as an emergency. | `string` | `"EMERGENCY"` | no |
| <a name="input_enable_key_protect"></a> [enable\_key\_protect](#input\_enable\_key\_protect) | Use the Key Protect integration | `bool` | `false` | no |
| <a name="input_enable_secrets_manager"></a> [enable\_secrets\_manager](#input\_enable\_secrets\_manager) | Use the Secrets Manager integration | `bool` | `true` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Default: false. Set to true to create the integration | `bool` | `false` | no |
| <a name="input_evidence_group"></a> [evidence\_group](#input\_evidence\_group) | Specify gitlab group for evidence repository | `string` | `""` | no |
| <a name="input_evidence_repo_auth_type"></a> [evidence\_repo\_auth\_type](#input\_evidence\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence\_repo\_git\_token\_secret\_name](#input\_evidence\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_inventory_group"></a> [inventory\_group](#input\_inventory\_group) | Specify gitlab group for inventory repository | `string` | `""` | no |
| <a name="input_inventory_repo_auth_type"></a> [inventory\_repo\_auth\_type](#input\_inventory\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory\_repo\_git\_token\_secret\_name](#input\_inventory\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_issues_group"></a> [issues\_group](#input\_issues\_group) | Specify gitlab group for issues repository | `string` | `""` | no |
| <a name="input_issues_repo_auth_type"></a> [issues\_repo\_auth\_type](#input\_issues\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues\_repo\_git\_token\_secret\_name](#input\_issues\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_kp_location"></a> [kp\_location](#input\_kp\_location) | IBM Cloud location/region containing the Key Protect instance. | `string` | `""` | no |
| <a name="input_kp_name"></a> [kp\_name](#input\_kp\_name) | Name of the Key Protect instance where the secrets are stored. | `string` | `""` | no |
| <a name="input_kp_resource_group"></a> [kp\_resource\_group](#input\_kp\_resource\_group) | The resource group containing the Key Protect instance for your secrets. | `string` | `""` | no |
| <a name="input_link_to_doi_toolchain"></a> [link\_to\_doi\_toolchain](#input\_link\_to\_doi\_toolchain) | Enable a link to a DevOpsInsights instance in another toolchain, true or false | `bool` | `false` | no |
| <a name="input_merge_cra_sbom"></a> [merge\_cra\_sbom](#input\_merge\_cra\_sbom) | Merge the SBOM | `string` | `"1"` | no |
| <a name="input_opt_out_v1_evidence"></a> [opt\_out\_v1\_evidence](#input\_opt\_out\_v1\_evidence) | Opt out of evidence v1 | `string` | `"1"` | no |
| <a name="input_pipeline_config_group"></a> [pipeline\_config\_group](#input\_pipeline\_config\_group) | Specify user/group for pipeline config repo | `string` | `""` | no |
| <a name="input_pipeline_config_path"></a> [pipeline\_config\_path](#input\_pipeline\_config\_path) | The name and path of the pipeline-config.yaml file within the pipeline-config repo | `string` | `".pipeline-config.yaml"` | no |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline\_config\_repo\_auth\_type](#input\_pipeline\_config\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_pipeline_config_repo_branch"></a> [pipeline\_config\_repo\_branch](#input\_pipeline\_config\_repo\_branch) | Specify the branch containing the custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_clone_from_url"></a> [pipeline\_config\_repo\_clone\_from\_url](#input\_pipeline\_config\_repo\_clone\_from\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_existing_url"></a> [pipeline\_config\_repo\_existing\_url](#input\_pipeline\_config\_repo\_existing\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_token_secret_name"></a> [pipeline\_config\_repo\_git\_token\_secret\_name](#input\_pipeline\_config\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_pipeline_debug"></a> [pipeline\_debug](#input\_pipeline\_debug) | '0' by default. Set to '1' to enable debug logging | `string` | `"0"` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline\_ibmcloud\_api\_key\_secret\_name](#input\_pipeline\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud api key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_region"></a> [region](#input\_region) | The target region where the app is deployed. | `string` | `""` | no |
| <a name="input_repositories_prefix"></a> [repositories\_prefix](#input\_repositories\_prefix) | Prefix name for the cloned compliance repos. | `string` | `"compliance-tf"` | no |
| <a name="input_satellite_cluster_group"></a> [satellite\_cluster\_group](#input\_satellite\_cluster\_group) | The Satellite cluster group | `string` | `""` | no |
| <a name="input_scc_enable_scc"></a> [scc\_enable\_scc](#input\_scc\_enable\_scc) | Enable the SCC integration | `bool` | `true` | no |
| <a name="input_scc_evidence_namespace"></a> [scc\_evidence\_namespace](#input\_scc\_evidence\_namespace) | The kind of evidence to be displayed, cc or cd | `string` | `"cd"` | no |
| <a name="input_scc_ibmcloud_api_key_secret_name"></a> [scc\_ibmcloud\_api\_key\_secret\_name](#input\_scc\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud api key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_scc_integration_name"></a> [scc\_integration\_name](#input\_scc\_integration\_name) | The name of the SCC integration name | `string` | `"Security and Compliance"` | no |
| <a name="input_scc_profile"></a> [scc\_profile](#input\_scc\_profile) | Security and Compliance Profile | `string` | `"compliance-profile"` | no |
| <a name="input_scc_scope"></a> [scc\_scope](#input\_scc\_scope) | Security and Compliance Scope | `string` | `"compliance-scope"` | no |
| <a name="input_scc_trigger_scan"></a> [scc\_trigger\_scan](#input\_scc\_trigger\_scan) | Can be set to 'enabled'. Note each scan may incur a charge. | `string` | `"disabled"` | no |
| <a name="input_slack_channel_name"></a> [slack\_channel\_name](#input\_slack\_channel\_name) | The Slack channel that notifications will be posted to. | `string` | `"my-channel"` | no |
| <a name="input_slack_notifications"></a> [slack\_notifications](#input\_slack\_notifications) | The switch that turns the Slack integration on or off | `string` | `"0"` | no |
| <a name="input_slack_pipeline_fail"></a> [slack\_pipeline\_fail](#input\_slack\_pipeline\_fail) | Generate pipeline failed notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_start"></a> [slack\_pipeline\_start](#input\_slack\_pipeline\_start) | Generate pipeline start notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_success"></a> [slack\_pipeline\_success](#input\_slack\_pipeline\_success) | Generate pipeline succeeded notifications. | `bool` | `true` | no |
| <a name="input_slack_team_name"></a> [slack\_team\_name](#input\_slack\_team\_name) | The Slack team name, which is the word or phrase before .slack.com in the team URL. | `string` | `"my-team"` | no |
| <a name="input_slack_toolchain_bind"></a> [slack\_toolchain\_bind](#input\_slack\_toolchain\_bind) | Generate tool added to toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_toolchain_unbind"></a> [slack\_toolchain\_unbind](#input\_slack\_toolchain\_unbind) | Generate tool removed from toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_webhook_secret_name"></a> [slack\_webhook\_secret\_name](#input\_slack\_webhook\_secret\_name) | Name of the webhook secret in the secret provider. | `string` | `"slack-webhook"` | no |
| <a name="input_sm_location"></a> [sm\_location](#input\_sm\_location) | IBM Cloud location/region containing the Secrets Manager instance. | `string` | `""` | no |
| <a name="input_sm_name"></a> [sm\_name](#input\_sm\_name) | Name of the Secrets Manager instance where the secrets are stored. | `string` | `""` | no |
| <a name="input_sm_resource_group"></a> [sm\_resource\_group](#input\_sm\_resource\_group) | The resource group containing the Secrets Manager instance for your secrets. | `string` | `""` | no |
| <a name="input_sm_secret_group"></a> [sm\_secret\_group](#input\_sm\_secret\_group) | The Secrets Manager secret group containing your secrets. | `string` | `"Default"` | no |
| <a name="input_source_environment"></a> [source\_environment](#input\_source\_environment) | The source environment that the app is promoted from. | `string` | `"master"` | no |
| <a name="input_target_environment"></a> [target\_environment](#input\_target\_environment) | The target environment that the app is deployed to. | `string` | `"prod"` | no |
| <a name="input_target_environment_detail"></a> [target\_environment\_detail](#input\_target\_environment\_detail) | Details of the environment being updated | `string` | `""` | no |
| <a name="input_target_environment_purpose"></a> [target\_environment\_purpose](#input\_target\_environment\_purpose) | Purpose of the environment being updated | `string` | `"production"` | no |
| <a name="input_toolchain_description"></a> [toolchain\_description](#input\_toolchain\_description) | Description for the Toolchain. | `string` | `"Toolchain created with terraform template for DevSecOps CD Best Practices"` | no |
| <a name="input_toolchain_name"></a> [toolchain\_name](#input\_toolchain\_name) | Name of the Toolchain. | `string` | `"DevSecOps CD Toolchain - Terraform"` | no |
| <a name="input_toolchain_region"></a> [toolchain\_region](#input\_toolchain\_region) | The region containing the CI toolchain | `string` | `""` | no |
| <a name="input_toolchain_resource_group"></a> [toolchain\_resource\_group](#input\_toolchain\_resource\_group) | Resource group within which toolchain will be created | `string` | `"Default"` | no |

## Outputs

#### DevSecOps CD Outputs

| Variables      | Description |
| ---           | ----        |
|toolchain_id   | The id of the created toolchain|
|secrets_manager_instance_id | The id if a Secrets Manager instance is used|
|key_protect_instance_id | The id if a Key Protect Instance is used|
|cd_pipeline_id| The id of the CI pipeline|
|secret_tool| Returns part of the references to point ot the secret tool integration |
|pipeline_repo_url | The URL of the Compliance Pipeline repository|
|deployment_repo_url | The URL of the Deployment repository |
|change_management_repo_url | The URL of Change Management repository |
