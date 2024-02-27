

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

packer {

  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }

}


source "amazon-ebs" "example" {
  access_key    = var.access_key
  secret_key    = var.secret_key
  region        = var.region
  source_ami    = var.source_ami
  instance_type = var.instance_type
  ssh_username  = var.ssh_user
  ami_name      = "${var.project_name}_{{timestamp}}"
  tags = {
    Name = "${var.project_name}-{{timestamp}}"
  }
}

build {
  sources = ["source.amazon-ebs.example"]

  provisioner "ansible" {
    playbook_file = var.ansible_playbook_file_syspackages
    extra_arguments = [
      "--scp-extra-args", "'-O'",
      "--extra-vars",
      "target_directory=${var.target_directory} private_key_str=${var.private_key_str} repo_url=${var.repo_url} remote_env_path=${var.remote_env_path} access_key=${var.access_key} secret_key=${var.secret_key}"
    ]
  }

  provisioner "ansible" {
    playbook_file = var.ansible_playbook_file_clonerepo
    extra_arguments = [
      "--scp-extra-args", "'-O'",
      "--extra-vars",
      "target_directory=${var.target_directory} private_key_str=${var.private_key_str} repo_url=${var.repo_url} remote_env_path=${var.remote_env_path} access_key=${var.access_key} secret_key=${var.secret_key}"
    ]
  }

  post-processor "manifest" {
    output = "out.json"
  }
}
