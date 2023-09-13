##############################################################################
# Outputs
##############################################################################

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.cd_pipeline_instance.pipeline_id
}
