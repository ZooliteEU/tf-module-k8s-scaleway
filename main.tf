# Terraform module to deploy a Kubernetes cluster on Scaleway
#This Terraform module deploys a Kubernetes cluster on Scaleway.
#
#- Multiple nodepools

terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.1.0"
    }
  }
}


resource "scaleway_k8s_cluster" "this" {
  name             = var.k8s_cluster_name
  version          = var.k8s_cluster_version
  cni              = var.k8s_cluster_cni_plugin
  tags             = var.tags

  autoscaler_config {
    disable_scale_down              = var.k8s_cluster_scale_down_disable
    scale_down_delay_after_add      = var.k8s_cluster_scale_down_delay
    estimator                       = var.k8s_cluster_estimator
    expander                        = var.k8s_cluster_expander
    ignore_daemonsets_utilization   = var.k8s_cluster_ignore_daemonsets
    balance_similar_node_groups     = var.k8s_cluster_balance_node_groups
    expendable_pods_priority_cutoff = var.k8s_cluster_priority_cutoff
  }

  dynamic "auto_upgrade" {
    for_each = var.k8s_auto_upgrade ? [1] : []
    content {
      enable                        = var.k8s_auto_upgrade
      maintenance_window_start_hour = var.k8s_auto_upgrade_window
      maintenance_window_day        = var.k8s_auto_upgrade_day
    }
  }
}

resource "scaleway_k8s_pool" "this" {
  count = length(var.k8s_cluster_node_pools)

  cluster_id        = scaleway_k8s_cluster.this.id
  name              = "${var.k8s_cluster_name}-pool-${count.index}"
  node_type         = var.k8s_cluster_node_pools[count.index].node_type
  size              = var.k8s_cluster_node_pools[count.index].node_count
  autoscaling       = var.k8s_cluster_node_pools[count.index].autoscaling_enable
  autohealing       = var.k8s_cluster_node_pools[count.index].autohealing_enable
  min_size          = var.k8s_cluster_node_pools[count.index].min_size
  max_size          = var.k8s_cluster_node_pools[count.index].max_size
  container_runtime = contains(keys(var.k8s_cluster_node_pools[count.index]), "container_runtime") ? var.k8s_cluster_node_pools[count.index].container_runtime : "docker"

  tags = var.tags
}
