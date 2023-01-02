# branch-protection

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 5.12.0 |

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.branch_protection_rule](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dismiss_stale_reviews"></a> [dismiss\_stale\_reviews](#input\_dismiss\_stale\_reviews) | Dismiss approved reviews automatically when a new commit is pushed. | `bool` | `true` | no |
| <a name="input_enforce_admins"></a> [enforce\_admins](#input\_enforce\_admins) | Setting this to true enforces status checks for repository administrators. In general this should be false to allow admins and service accounts to reconcile branches after a release without creating trailing merge commits -- branches would never be current with one another. | `bool` | `true` | no |
| <a name="input_pattern"></a> [pattern](#input\_pattern) | The pattern identifying branches to which this protection rule will apply. | `string` | n/a | yes |
| <a name="input_push_restrictions"></a> [push\_restrictions](#input\_push\_restrictions) | A list of actor IDs that are explicitly permitted to push to the branch. Admins have this capability if `enforce_admins` is false. | `set(string)` | `[]` | no |
| <a name="input_repository_id"></a> [repository\_id](#input\_repository\_id) | The ID of the repository in which this branch protection rule will be created. | `string` | n/a | yes |
| <a name="input_require_code_owner_reviews"></a> [require\_code\_owner\_reviews](#input\_require\_code\_owner\_reviews) | Whether or not an approval is required from code owners to merge a pull request. | `bool` | `true` | no |
| <a name="input_require_signed_commits"></a> [require\_signed\_commits](#input\_require\_signed\_commits) | Requires all commits in the branch to be signed with GPG. | `bool` | `true` | no |
| <a name="input_required_approving_review_count"></a> [required\_approving\_review\_count](#input\_required\_approving\_review\_count) | The number of approvals required to satisfy branch protection requirements. This must be a number between 1 and 6. | `number` | `1` | no |
| <a name="input_required_status_checks"></a> [required\_status\_checks](#input\_required\_status\_checks) | A list of status checks (contexts) that must pass before a branch can be merged into the protected branch. | `set(string)` | `[]` | no |
| <a name="input_review_dismissal_restrictions"></a> [review\_dismissal\_restrictions](#input\_review\_dismissal\_restrictions) | The list of actor IDs with dismissal access. | `set(string)` | `[]` | no |
| <a name="input_strict"></a> [strict](#input\_strict) | Setting this to true enforces that a branch be current with the base branch before merging. | `bool` | `true` | no |
