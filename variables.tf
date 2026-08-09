variable "name" {
  type        = string
  description = "Name of the Composer environment"

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "var.name must be a non-empty string"
  }
}

variable "kms_key_name" {
  type        = string
  description = "CMEK key used to encrypt environment GCS buckets, Cloud SQL and state"
  sensitive   = true

  validation {
    condition     = length(trimspace(var.kms_key_name)) > 0
    error_message = "var.kms_key_name must be a non-empty string"
  }
}

variable "network" {
  type        = string
  description = "Self-link of the VPC network for the environment"

  validation {
    condition     = length(trimspace(var.network)) > 0
    error_message = "var.network must be a non-empty string"
  }
}

variable "subnetwork" {
  type        = string
  description = "Self-link of the subnetwork for the environment"

  validation {
    condition     = length(trimspace(var.subnetwork)) > 0
    error_message = "var.subnetwork must be a non-empty string"
  }
}

variable "region" {
  type        = string
  description = "Region of the Composer environment"

  validation {
    condition     = length(trimspace(var.region)) > 0
    error_message = "var.region must be a non-empty string"
  }
}


variable "web_server_allowed_ip_range" {
  type        = string
  description = "CIDR range of IP addresses allowed to access the web server"

  validation {
    condition     = length(trimspace(var.web_server_allowed_ip_range)) > 0
    error_message = "var.web_server_allowed_ip_range must be a non-empty string"
  }
}

variable "web_server_allowed_ip_description" {
  type        = string
  description = "Description of the allowed IP range for web server access"

  validation {
    condition     = length(trimspace(var.web_server_allowed_ip_description)) > 0
    error_message = "var.web_server_allowed_ip_description must be a non-empty string"
  }
}

variable "project" {
  type        = string
  description = "GCP project where the Composer environment will be created"

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "var.project must be a non-empty string"
  }
}