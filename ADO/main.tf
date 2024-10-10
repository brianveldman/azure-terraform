// Create a new Azure DevOps project
resource "azuredevops_project" "project" {
    name = local.ado_project_name
    description = local.ado_project_description
    visibility = var.ado_project_visibility
    version_control = var.ado_version_control
    work_item_template = var.ado_work_item_template
}

// Create a new Azure DevOps Git repository
resource "azuredevops_git_repository" "repo" {
  name       = var.ado_repository_name
  project_id = azuredevops_project.project.id
  default_branch = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
}

// Create a new Azure DevOps Git repository file
resource "azuredevops_git_repository_file" "pipeline" {
  repository_id = azuredevops_git_repository.repo.id
  file = "pipelines/bicep-pipeline.yml"
  content = "${path.module}/repo-files/bicep-pipeline.yml"
  branch = "refs/heads/main"
  commit_message = "Adding Bicep pipeline file"
  overwrite_on_create = false
}

// Create a new Azure DevOps Git repository file
resource "azuredevops_git_repository_file" "ignore" {
  repository_id = azuredevops_git_repository.repo.id
  file = ".gitignore"
  content = "${path.module}/repo-files/.gitignore"
  branch = "refs/heads/main"
  commit_message = "Adding .gitignore file"
  overwrite_on_create = false
}

// Create a new Azure DevOps branch policy
resource "azuredevops_branch_policy_min_reviewers" "policy" {
    project_id = azuredevops_project.project.id
    settings {
      reviewer_count = 2
      submitter_can_vote = false
      on_push_reset_approved_votes = true
    scope {
      repository_id = azuredevops_git_repository.repo.id
      repository_ref = "refs/heads/main"
      match_type = "Exact"
    }
    }
    depends_on = [ 
      azuredevops_git_repository_file.pipeline,
      azuredevops_git_repository_file.ignore 
  ]
} 

// Defining work item link
resource "azuredevops_branch_policy_work_item_linking" "name" {
  project_id = azuredevops_project.project.id
  enabled = true
  blocking = true
  settings {
    scope {
    repository_id = azuredevops_git_repository.repo.id
    repository_ref = azuredevops_git_repository.repo.default_branch
    match_type = "Exact"
    }
  }
    depends_on = [ 
      azuredevops_git_repository_file.pipeline,
      azuredevops_git_repository_file.ignore 
  ]
}