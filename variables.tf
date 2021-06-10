variable "role_name" {
  type        = string
  description = "DLM Role name"
  default     = "AWSDataLifecycleManagerRole"
}

variable "role_path" {
  type        = string
  description = "DLM Role path"
  default     = "/"
}

variable "role_description" {
  type        = string
  description = "DLM Role description"
  default     = "AWS DLM Role"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}

variable "enable_snapshot_lifecycle" {
  type        = bool
  description = "Enable snapshot lifecycle management"
  default     = false
}

variable "enable_ami_lifecycle" {
  type        = bool
  description = "Enable AMI lifecycle management"
  default     = false
}
