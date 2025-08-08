# CST8918 - DevOps: Infrastructure as Code  


## Lab 12: Terraform CI/CD on Azure with GitHub Actions

### Submitted By : 
- Jaspreet Singh (https://github.com/jaspreet1388)
- Romeo De Guzman II (https://github.com/degu0055)
- Akshay Malik (https://github.com/Mali0154)

## Background

This lab is based on the scenario of an integrated git project with Terraform and Azure. Imagine that the project is a simple web application that is containerized and deployed to an Azure Kubernetes Service (AKS) cluster. The application and it's Dockerfile would be defined in the `app` folder.


The infrastructure is defined in a Terraform configuration in the `infra` folder. The Terraform configuration creates supporting resources in Azure and deploys the sample web application to the cluster.#3 ####

Here we will create several GitHub Actions CI/CD workflows for automating


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



## Submission

1. Submit the URL of your GitHub repository.
2. Include in your submission a screenshot of the Pull Request showing the successful completion of the workflows - expand the "All checks have passed" section to show the steps.
3. Include in your submission a screenshot of the Pull Request showing the expanded results of the Terraform Plan step.
4. Embed the screenshots in your README.md file.
5. The README.md file should clearly identify the full name and GitHub username of each team member.

## Additional References

NA
