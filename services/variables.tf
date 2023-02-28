variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager Toolchain Service Instance in IBM Cloud"
}

variable "sm_resource_group" {
  type        = string
  description = "Name of the Secrets Manager Toolchain resource group in IBM Cloud"
}

variable "sm_location" {
  type        = string
  description = "Name of the Secrets Manager Toolchain resource group in IBM Cloud"
}

variable "kp_name" {
}

variable "kp_resource_group" {
}

variable "kp_location" {
}

variable "enable_key_protect" {
}

variable "enable_secrets_manager" {
}

variable "cluster_name" {
}

variable "cluster_namespace" {
}

variable "cluster_region" {
}

variable "registry_namespace" {
}

variable "registry_region" {
}

variable "region" {
}

variable "ibm_cloud_api" {
}