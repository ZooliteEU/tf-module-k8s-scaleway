output "api_url" {
  value       = scaleway_k8s_cluster.this.apiserver_url
  description = "URL of the Kubernetes API"
}

output "config_file" {
  value       = scaleway_k8s_cluster.this.kubeconfig
  description = "Client (kubeconfig) configuration file"
}

