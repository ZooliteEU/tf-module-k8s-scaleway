# -----------------------------------------------------------------------------
# Required variables
# -----------------------------------------------------------------------------

# -- Provider
variable "region" {}

variable "zone" {}

# -- k8s cluster
variable "k8s_cluster_name" {
  description = "Name of the k8s cluster."
  type        = string
}

# -----------------------------------------------------------------------------
# Optional variables 
# -----------------------------------------------------------------------------
variable "tags" {
  description = "Tags associated to this cluster"
  type        = list
  default     = []
}

# -- k8s Node pool resources
variable "k8s_cluster_node_pools" {
  description = "Define a list of node pools to associate to this cluster."
  type        = list(map(string))
  default = []
}


# -- k8s cluster resources
variable "k8s_cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.18.0"
}

variable "k8s_cluster_cni_plugin" {
  description = "Container Network Interface (CNI) for this cluster"
  type        = string
  default     = "cilium"
}

variable "k8s_cluster_dashboard_enable" {
  description = "Enable the Kubernetes dashboard"
  type        = bool
  default     = false
}

variable "k8s_cluster_ingress_controller" {
  description = "Ingress controller to deploy with this cluster"
  type        = string
  default     = "none"
}


# -- k8s cluster autoscaling resources
variable "k8s_cluster_scale_down_disable" {
  description = "Disabled the option to scale down"
  type        = bool
  default     = false
}

variable "k8s_cluster_scale_down_delay" {
  description = "Time to wait after scale up before resuming scale down"
  type        = string
  default     = "10m"
}

variable "k8s_cluster_estimator" {
  description = "Type of resource estimator to be used in scale up"
  type        = string
  default     = "binpacking"
}

variable "k8s_cluster_expander" {
  description = "Type of node group expander to be used in scale up"
  type        = string
  default     = "random"
}

variable "k8s_cluster_ignore_daemonsets" {
  description = "Ignore DaemonSet pods when calculating resource utilization"
  type        = bool
  default     = false
}

variable "k8s_cluster_balance_node_groups" {
  description = "Detect similar node groups and balance the number of nodes between them"
  type        = bool
  default     = false
}

variable "k8s_cluster_priority_cutoff" {
  description = "Pods with priority below cutoff will be expendable. They can be killed without any consideration during scale down and they don't cause scale up. Pods with null priority (PodPriority disabled) are non expendable"
  type        = number
  default     = -10
}

# -- k8s cluster auto upgrade
variable "k8s_auto_upgrade" {
  description = "Enable auto upgrade of k8s cluster version"
  type = bool
  default = false
}

variable "k8s_auto_upgrade_window" {
  description = "Start hour of the maintenance window to perform auto upgrade."
  type = number
  default = 22
}

variable "k8s_auto_upgrade_day" {
  description = "The day of the maintenance window to perform auto upgrade."
  type = string
  default = "any"
}
