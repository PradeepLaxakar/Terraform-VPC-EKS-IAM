## This Terraform project provisions an AWS infrastructure that includes:

- **EKS (Elastic Kubernetes Service)**
- **IAM (Identity and Access Management)**
- **VPC (Virtual Private Cloud)**
- **ACR (Amazon Container Registry)**

The modules for these resources are located in the `modules/` directory. The root module contains configuration files to deploy the infrastructure for different environments (`stage` and `prod`).

## Directory Structure

```plaintext
.
├── backend.tf                # Backend configuration (default)
├── backend-prod.tfvars       # Backend configuration for production
├── backend-stage.tfvars      # Backend configuration for staging
├── main.tf                   # Main Terraform configuration file
├── module/                   # Contains all Terraform modules (eks, iam, vpc, acr)
├── output.tf                 # Output values
├── prod.tfvars               # Variables for the production environment
├── stage.tfvars              # Variables for the staging environment
├── variable.tf               # Variable definitions
├── script/                   # Contains any helper scripts
└── README.md                 # This README file
```

## Prerequisites

Before running the Terraform commands, ensure that you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- AWS CLI configured with appropriate credentials
- kubectl (for interacting with EKS cluster)
- jq (for parsing JSON output, if needed)

## Usage

### Step 1: Initialize Terraform Backend

Run the following command to initialize the Terraform backend:

```sh
terraform init -backend-config=backend-<stage/prod>.tfvars
```

Replace `<stage/prod>` with the desired environment (`stage` or `prod`).

### Step 2: Apply Terraform Configuration

Apply the Terraform configuration to create the infrastructure:

```sh
terraform apply --var-file=<stage/prod>.tfvars
```

### Step 3: Retrieve IAM User Password

To fetch the IAM user password, run:

```sh
terraform output --raw iam-user-password
```

## Cleanup

To destroy the created resources, use the following command:

```sh
terraform destroy --var-file=<stage/prod>.tfvars
```

## Notes

- Ensure you have the necessary permissions to create AWS resources.
- Review the `prod.tfvars` and `stage.tfvars` files before applying changes.
- Use the `script/` directory for any helper automation scripts.

## Troubleshooting

- If Terraform initialization fails, verify that the backend configuration file exists.
- If resource creation fails, check AWS IAM permissions and quotas.
- If EKS cluster authentication fails, update kubeconfig:

  ```sh
  aws eks update-kubeconfig --name <eks-cluster-name> --region <aws-region>
  ```

