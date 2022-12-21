# repository-collaborator

## Requirements

| Name                                                                      | Version    |
|---------------------------------------------------------------------------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_github"></a> [github](#requirement\_github)          | >= 5.12.0  |

## Providers

| Name                                                       | Version   |
|------------------------------------------------------------|-----------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 5.12.0 |

## Resources

| Name                                                                                                                                                     | Type     |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [github_repository_collaborator.collaborator](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator) | resource |

## Inputs

| Name                                                             | Description                                                                       | Type     | Default | Required |
|------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------|---------|:--------:|
| <a name="input_permission"></a> [permission](#input\_permission) | The level of access being granted to the user. One of `pull`, `push`, or `admin`. | `string` | n/a     |   yes    |
| <a name="input_repository"></a> [repository](#input\_repository) | The name of the repository to which the user is being granted permissions.        | `string` | n/a     |   yes    |
| <a name="input_username"></a> [username](#input\_username)       | The username of the user being granted access to the repository.                  | `string` | n/a     |   yes    |
