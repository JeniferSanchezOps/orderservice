variable "project_id" {
  description = "GCP project id"
  type        = string
  default     = "iron-crane-478902-g6"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "credentials_file" {
  description = "Path to service account JSON"
  type        = string
  default     = "/Users/jenifersanchez/tf-gke-sa-key.json"
}

variable "cluster_name" {
  description = "GKE cluster name"
  type        = string
  default     = "orders-cluster"
}

variable "node_count" {
  description = "Initial node count"
  type        = number
  default     = 2
}

variable "disk_size_gb" {
  description = "Node disk size in GB"
  type        = number
  default     = 50
}

variable "machine_type" {
  description = "Node machine type"
  type        = string
  default     = "e2-medium"
}

variable "replicas" {
  description = "Deployment replicas"
  type        = number
  default     = 3
}

variable "image" {
  description = "Container image to deploy"
  type        = string
  default     = "jensanchez/orderservice:v7"
}

// ...existing code...
variable "dockerhub_username" {
  description = "Docker Hub username"
  type        = string
  default     = "jensanchez"
}

variable "dockerhub_password" {
  description = "Docker Hub password"
  type        = string
  default     = ""
}