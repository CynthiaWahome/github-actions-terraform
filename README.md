# GitHub Actions Terraform Automation

This repository contains a Terraform configuration and a GitHub Actions workflow to automate the deployment and management of AWS infrastructure. The primary goal of this project is to demonstrate how to use Terraform for infrastructure as code (IaC) and GitHub Actions for continuous integration and continuous deployment (CI/CD).

## Features

- **Terraform Configuration**: The `main.tf` file defines the AWS infrastructure, including an EC2 instance. It uses variables for `vpc_id` and `subnet_id` to ensure flexibility and security.
- **State Management**: The `backend.tf` file configures Terraform to use an S3 backend for storing the state file, ensuring that the state is managed remotely and securely.
- **GitHub Actions Workflow**: The `terraform.yaml` file in the `.github/workflows` directory automates the Terraform operations. It supports both `apply` and `destroy` actions, which can be triggered manually or on pushes to the `main` branch.
- **Secure Secrets Management**: AWS credentials and other sensitive information are stored as GitHub Secrets, ensuring they are not exposed in the repository.

## How It Works

1. **Initialization**: The workflow starts by checking out the repository and setting up Terraform.
2. **Terraform Init**: Initializes the Terraform configuration and backend.
3. **Terraform Plan**: Generates an execution plan to show what actions Terraform will take.
4. **Terraform Apply**: Applies the changes required to reach the desired state of the configuration.
5. **Terraform Destroy**: Optionally destroys the infrastructure based on manual input.

## Prerequisites

- **Terraform**: Install the [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli) to use this repository locally.
- **AWS Account**: An AWS account with appropriate IAM permissions.

## Usage

To use this repository, follow these steps:

1. **Clone the Repository**: Clone the repository to your local machine.
   ```bash
   git clone https://github.com/your-username/repository-name.git
   ```
2. **Configure AWS Credentials**
Add your AWS credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) as GitHub Secrets.

3. **Set VPC and Subnet IDs (optional)**
Add `VPC_ID` and `SUBNET_ID` as GitHub Secrets.  
*Note*: `VPC_ID` and `SUBNET_ID` can be specified as a secret if you’re using a non-default VPC or if Terraform cannot automatically detect it.

4. **Run the Workflow**
Push changes to the `main` branch or manually trigger the workflow from the GitHub Actions tab.

5. **Benefits**

  - **Automation**: Automates the deployment and management of AWS infrastructure.
  - **Security**: Uses GitHub Secrets to securely manage sensitive information.
  - **Flexibility**: Supports both `apply` and `destroy` actions, providing full control over the infrastructure lifecycle.
  - **Scalability**: Easily extendable to include more complex infrastructure components.


This repository serves as a practical example of integrating Terraform with GitHub Actions to achieve automated, secure, and efficient infrastructure management.

