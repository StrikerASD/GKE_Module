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