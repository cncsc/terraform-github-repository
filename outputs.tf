output "id" {
  description = "The ID of the repository."
  value       = github_repository.repo.id
}

output "node_id" {
  description = "The Node ID of the repository."
  value       = github_repository.repo.node_id
}

output "full_name" {
  description = "The full name of the repository in the form `org-name/repo-name`."
  value       = github_repository.repo.full_name
}

output "ssh_clone_url" {
  description = "The URL that can be provided to `git clone` to clone the repository via SSH."
  value       = github_repository.repo.ssh_clone_url
}

output "http_clone_url" {
  description = "The URL that can be provided to `git clone` to clone the repository via HTTPS."
  value       = github_repository.repo.http_clone_url
}

output "git_clone_url" {
  description = "The URL that can be provided to `git clone` to clone the repository anonymously via the git protocol."
  value       = github_repository.repo.git_clone_url
}

output "svn_url" {
  description = "The URL that can be provided to `svn checkout` to check out the repository via GitHub's Subversion protocol emulation."
  value       = github_repository.repo.svn_url
}
