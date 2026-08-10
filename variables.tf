variable "name" {
  type        = string
  description = "Name of the Composer environment"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{0,20}$", var.name))
    error_message = "var.name must be 1-21 characters, lowercase alphanumeric or hyphens, starting with a letter — it is used to derive the composer-${var.name} service account ID, which GCP limits to 30 characters."
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

variable "maintenance_window_start_time" {
  type        = string
  description = "Start time (RFC3339) of the first recurrence of the maintenance window"

  validation {
    condition     = length(trimspace(var.maintenance_window_start_time)) > 0
    error_message = "var.maintenance_window_start_time must be a non-empty string"
  }
}

variable "maintenance_window_end_time" {
  type        = string
  description = "End time (RFC3339) of the maintenance window, used only to calculate its duration"

  validation {
    condition     = length(trimspace(var.maintenance_window_end_time)) > 0
    error_message = "var.maintenance_window_end_time must be a non-empty string"
  }
}

variable "maintenance_window_recurrence" {
  type        = string
  description = "Maintenance window recurrence, RFC-5545 RRULE subset (e.g. \"FREQ=WEEKLY;BYDAY=SA\")"

  validation {
    condition     = length(trimspace(var.maintenance_window_recurrence)) > 0
    error_message = "var.maintenance_window_recurrence must be a non-empty string"
  }
}

variable "image_version" {
  type        = string
  description = "Composer/Airflow image version, e.g. \"composer-2-airflow-2\""
  default     = "composer-2-airflow-2"

  validation {
    condition     = length(trimspace(var.image_version)) > 0
    error_message = "var.image_version must be a non-empty string"
  }
}
