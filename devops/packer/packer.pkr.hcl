

packer {
  
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      source  = "github.com/hashicorp/ansible"
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
      "target_directory=${var.target_directory} remote_key_path=${var.remote_key_path} github_user=${var.github_user} ssh_key_comment=${var.ssh_key_comment} private_key=${var.private_key} local_env_file_path=${var.local_env_file_path} remote_env_path=${var.remote_env_path} github_repo_url=${var.github_repo_url} local_key_file_path=${var.local_key_file_path}"
    ]
  }

  provisioner "ansible" {
    playbook_file = var.ansible_playbook_file_clonerepo
    extra_arguments = [
      "--scp-extra-args", "'-O'",
      "--extra-vars",
      "target_directory=${var.target_directory} remote_key_path=${var.remote_key_path} github_user=${var.github_user} ssh_key_comment=${var.ssh_key_comment} private_key=${var.private_key} local_env_file_path=${var.local_env_file_path} remote_env_path=${var.remote_env_path} github_repo_url=${var.github_repo_url} local_key_file_path=${var.local_key_file_path}"
    ]
  }

  post-processor "manifest" {
    output = "out.json"
  }
}
