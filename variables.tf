variable "sa_account_id" {
  type = string
  description = "Google Service Account ID"
}

variable "sa_display_name" {
  type = string
  description = "Display name for google_service_account resource"
}

variable "container_cluster_name" {
  type = string
  description = "Name for google_container_cluster resource"
}

variable "container_cluster_location" {
  type = string
  description = "Location for google_container_cluster resource"
  default = "europe-west3"
}

variable "container_cluster_remove_default_node_pool" {
  type = bool
  description = "Boolean value for deletion of node pool which by default is set to true for google_container_cluster resource"
  default = true
}

variable "container_cluster_initial_node_count" {
  type = number
  description = "Number of initial nodes for google_container_cluster resource"
  default = 1
}

variable "container_node_pool_name" {
  type = string
  description = "Name for node pool in google_container_node_pool resource"
}

variable "container_node_pool_location" {
  type = string
  description = "Location for google_container_node_pool resource"
  default = "europe-west3"
}

variable "container_node_pool_node_count" {
  type = number
  description = "Number of nodes for google_container_node_pool resource"
  default = 1
}

variable "node_config_preemptible" {
  type = bool
  description = "Boolean value for preemtiveness for node"
  default = true
}

variable "node_config_machine_type" {
  type = string
  description = "Machine type for the node - it can be e2-medium for example"
  default = "e2-medium"
}

variable "node_config_oauth_scopes" {
  type = list(string)
  description = "oath scopes for node_config"
  default = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
}

### Variables for state_bucket.tf

variable "google_kms_key_ring_name" {
  type = string
  description = "Please enter keyring name"
  default = "gke-keyring"
}

variable "google_kms_key_ring_location" {
  type = string
  description = "Location of the keyring. By default it will be europe-west3"
  default = "europe-west3"
}

variable "google_kms_key_ring_project" {
  type = string
  description = "Project ID in which keyring will reside. It will be Project ID in google console, and NOT Project number"
}

variable "google_kms_crypto_key_name" {
  type = string
  description = "The name of the key, for example gke-key"
  default = "gke-key"
}

variable "google_kms_crypto_key_key_ring" {
  type = string
  description = "Name of a key ring. The example might be like that: (key_ring = google_kms_key_ring.my_keyring.id). Depends on resource name - my_keyring in this example"
}

variable "google_kms_crypto_key_rotation_period" {
  type = string
  description = "Rotation period in which key should be replaced"
  default = "100000s"
}

variable "google_kms_crypto_key_iam_member_crypto_key_id" {
  type = string
  description = "We obtain this from existing field - gke-keyring: (crypto_key_id = google_kms_crypto_key.my_key.id), it depends on resource name - my_key in this example"
}

variable "google_kms_crypto_key_iam_member_role" {
  type = string
  description = "Describe IAM role for access to the keyring"
  default = "roles/cloudkms.admin"
}

variable "google_kms_crypto_key_iam_member_member" {
  type = string
  description = "Service Account which will have access to the keyring, which was already created in variables above."
  default = var.sa_account_id
}

variable "google_storage_bucket_name" {
  type = string
  description = "Name of a storage bucket, needs to be unique. Example: terraform_state_bucket-9287543"
}

variable "google_storage_bucket_location" {
  type = string
  description = "Location of storage bucket, default is europe-west3"
  default = "europe-west3"
}

variable "google_storage_bucket_versioning_enabled" {
  type = bool
  description = "Specify if versioning of the bucket shall apply"
  default = true
}

variable "google_storage_bucket_lifecycle_rule_condition_age" {
  type = number
  description = "Age for lifecycle rule. Default is 30 days"
  default = 30
}

variable "google_storage_bucket_lifecycle_rule_action_type" {
  type = string
  description = "What action to take when 30 days will go by. Default is - delete"
  default = "delete"
}

variable "google_storage_bucket_encryption_default_kms_key_name" {
  type = string
  description = "Example - https://github.com/StrikerASD/gcp-infra/blob/main/terraform/tfstate-bucket.tf#L37"
}