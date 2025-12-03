output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "load_balancer_ip" {
  description = "External IP of the LoadBalancer (may take a few minutes to provision)"
  value       = kubernetes_service.orders_lb.status[0].load_balancer[0].ingress[0].ip
  sensitive   = false
}