terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

variable "github_owner" {
  type = string
}

variable "catalog_repo" {
  type    = string
  default = "helios-workshop-catalog"
}

variable "catalog_path" {
  type    = string
  default = "pilot/helios.json"
}

provider "github" {
  owner = var.github_owner
}

resource "github_repository_file" "catalog" {
  repository          = var.catalog_repo
  branch              = "main"
  file                = var.catalog_path
  overwrite_on_create = false

  content = jsonencode({
    button       = { variant = "primary" }
    action_color = { value = "#0055ff", deprecated = false }
  })
}
