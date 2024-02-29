
variable "region" {
  type    = string
}

variable "source_ami" {
  type    = string
}


variable "access_key" {
  type    = string
}

variable "secret_key" {
  type    = string
}


variable "instance_type" {
  type    = string
}

variable "ssh_user" {
  type    = string
}


variable "project_name" {
  type    = string
}

variable "ansible_playbook_file_syspackages" {
  type    = string
}


variable "ansible_playbook_file_clonerepo" {
  type    = string
}


variable "target_directory" {
  type    = string
}


variable "private_key_str" {
  type    = string
}


variable "repo_url" {
  type    = string
}


variable "remote_env_path" {
  type    = string
}


variable "remote_env_file" {
  type    = string
}


variable "remote_key_path" {
  type    = string
}


variable "private_key" {
  type    = string
}
