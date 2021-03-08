## Requirements

| Name | Version |
|------|---------|
| scaleway | 2.0.0-rc1 |

## Providers

| Name | Version |
|------|---------|
| scaleway | 2.0.0-rc1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| k8s\_auto\_upgrade | Enable auto upgrade of k8s cluster version | `bool` | `false` | no |
| k8s\_auto\_upgrade\_day | The day of the maintenance window to perform auto upgrade. | `string` | `"any"` | no |
| k8s\_auto\_upgrade\_window | Start hour of the maintenance window to perform auto upgrade. | `number` | `22` | no |
| k8s\_cluster\_balance\_node\_groups | Detect similar node groups and balance the number of nodes between them | `bool` | `false` | no |
| k8s\_cluster\_cni\_plugin | Container Network Interface (CNI) for this cluster | `string` | `"cilium"` | no |
| k8s\_cluster\_dashboard\_enable | Enable the Kubernetes dashboard | `bool` | `false` | no |
| k8s\_cluster\_estimator | Type of resource estimator to be used in scale up | `string` | `"binpacking"` | no |
| k8s\_cluster\_expander | Type of node group expander to be used in scale up | `string` | `"random"` | no |
| k8s\_cluster\_ignore\_daemonsets | Ignore DaemonSet pods when calculating resource utilization | `bool` | `false` | no |
| k8s\_cluster\_ingress\_controller | Ingress controller to deploy with this cluster | `string` | `"none"` | no |
| k8s\_cluster\_name | Name of the k8s cluster. | `string` | n/a | yes |
| k8s\_cluster\_node\_pools | Define a list of node pools to associate to this cluster. | `list(map(string))` | `[]` | no |
| k8s\_cluster\_priority\_cutoff | Pods with priority below cutoff will be expendable. They can be killed without any consideration during scale down and they don't cause scale up. Pods with null priority (PodPriority disabled) are non expendable | `number` | `-10` | no |
| k8s\_cluster\_scale\_down\_delay | Time to wait after scale up before resuming scale down | `string` | `"10m"` | no |
| k8s\_cluster\_scale\_down\_disable | Disabled the option to scale down | `bool` | `false` | no |
| k8s\_cluster\_version | Kubernetes version | `string` | `"1.18.0"` | no |
| region | -- Provider | `any` | n/a | yes |
| tags | Tags associated to this cluster | `list(any)` | `[]` | no |
| zone | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| api\_url | URL of the Kubernetes API |
| config\_file | Client (kubeconfig) configuration file |

