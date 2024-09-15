### Module configuration for separately managed node pool (recommended by google)

resource "google_compute_network" "gke-network" {
  project = var.project
  name = var.google_compute_network_name
  lifecycle {
  create_before_destroy = true
  }
}

resource "google_service_account" "default" {
  project      = var.project
  account_id   = var.sa_account_id
  display_name = var.sa_display_name
  lifecycle {
  create_before_destroy = true
  }
}

resource "google_container_cluster" "primary" {
  project  = var.project
  name     = var.container_cluster_name
  location = var.container_cluster_location
  network = google_compute_network.gke-network.name
  deletion_protection = var.deletion_protection
  enable_autopilot = var.enable_autopilot

#   # We can't create a cluster with no node pool defined, but we want to only use
#   # separately managed node pools. So we create the smallest possible default
#   # node pool and immediately delete it.
#   remove_default_node_pool = var.container_cluster_remove_default_node_pool
#   initial_node_count       = var.container_cluster_initial_node_count
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  project    = var.project
  name       = var.container_node_pool_name
  location   = var.container_node_pool_location
  cluster    = google_container_cluster.primary.name
  node_count = var.container_node_pool_node_count

  node_config {
    preemptible  = var.node_config_preemptible
    machine_type = var.node_config_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = var.node_config_oauth_scopes
  }
}
