CST8918 - DevOps: Infrastructure as Code  
Prof. Robert McKenney

# Lab 12: Terraform CI/CD on Azure with GitHub Actions

## Background

This lab is based on the scenario of an integrated git project with Terraform and Azure. Imagine that the project is a simple web application that is containerized and deployed to an Azure Kubernetes Service (AKS) cluster. The application and it's Dockerfile would be defined in the `app` folder.##checkck####dummy

> [!IMPORTANT]
> The application code is not provided in this lab. The focus is on the infrastructure as code (IaC) aspect of the example project. There is an empty `app` folder as a representation of the application code. Some change

The infrastructure is defined in a Terraform configuration in the `infra` folder. The Terraform configuration creates supporting resources in Azure and deploys the sample web application to the cluster. 

You will create several GitHub Actions CI/CD workflows for automating:#fix##fixx##fixx

- **static code analysis** of a Terraform configuration on push to any branch
- running all Terraform **integration tests** on pull request to the main branch
- **deployment** of a Terraform configuration to Azure on merge to the main branch
- daily **drift detection** of the deployed infrastructure v.s. the Terraform configuration

A separate Terraform "backend" configuration will create the storage account and container to store your Terraform state file for the application infrastructure.

### Project folder structure

When you are done, your project folder structure should look like this:##fix

```plaintext
cst8918-w25-lab12
├── .github
│   └── workflows
│       ├── infra-ci-cd.yml
│       ├── infra-drift-detection.yml
│       └── infra-static-tests.yml
├── app
│   └── .gitkeep
├── infra
│   ├── az-federated-credential-params
|   |   ├── branch-main.json
│   │   ├── production-deploy.json
|   |   └── pull-request.json
│   ├── tf-app
│   |   ├── .tflint.hcl
│   │   ├── main.tf
│   │   ├── outputs.tf
|   │   ├── terraform.tf
│   │   └── variables.tf
│   └── tf-backend
│       └── main.tf
├── screenshots
│   ├── pr-checks.png
│   └── pr-tf-plan.png
├── .editorconfig
├── .gitignore
└── README.md
```

## Instructions

This lab should be completed in teams of two. One team member will create the GitHub repository and invite the other as a collaborator. Most of the numbered steps should be completed by one of the team member committing and pushing the code on a dev branch, with the other team member reviewing and approving the pull request. Each team member should contribute equally to the codebase.

> [!IMPORTANT]
> Submissions with only one team member's contributions will incur 20% grade penalty for that team member, and the other team member will receive a grade of zero (0). Collaboration is required!

Full instructions for each step can be found in the [docs](docs) folder. Please complete each step in order.

1. Setup your GitHub repo with an environment and branch protection rules.
2. Configure Terraform to use Azure Blob Storage for remote state.
3. Create Azure access credentials for automation with GitHub Actions.
4. Add Azure identity values as _secrets_ in your GitHub repo.
5. Update the Terraform configuration to use the Azure identity values.
6. Create a GitHub Actions workflows to:  
   6.1 run Terraform static analysis.  
   6.2 run Terraform integration tests.  
   6.3 deploy the Terraform infrastructure.  
   6.4 detect drift between Terraform and Azure.  
7. Test the workflows by making changes to the Terraform configuration.

## Submission

1. Submit the URL of your GitHub repository.
2. Include in your submission a screenshot of the Pull Request showing the successful completion of the workflows - expand the "All checks have passed" section to show the steps.
3. Include in your submission a screenshot of the Pull Request showing the expanded results of the Terraform Plan step.
4. Embed the screenshots in your README.md file.
5. The README.md file should clearly identify the full name and GitHub username of each team member.

## Additional References

Based on the [GitHub Actions Workflows for Terraform](https://github.com/Azure-Samples/terraform-github-actions)

https://learn.microsoft.com/en-ca/azure/developer/github/connect-from-azure?tabs=azure-cli%2Clinux#use-the-azure-login-action-with-openid-connect
