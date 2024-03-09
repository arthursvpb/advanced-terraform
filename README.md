# Terraform Quick Guide

<div align="center">
<img width="100" src="https://user-images.githubusercontent.com/25181517/183345121-36788a6e-5462-424a-be67-af1ebeda79a2.png" />
</div>

<div align="right">
<a href="https://www.terraform.io/">Learn More at terraform.io</a>
</div>

Terraform automates the deployment of infrastructure through **Infrastructure as Code (IaC)**, creating and managing components across various providers via an abstraction layer.

### Key Concepts:

- **Providers**: Plugins for managing resources with cloud providers like AWS, Azure, Google Cloud, Docker, Kubernetes, etc.
- **Resources**: Individual infrastructure components.
- **Modules**: Reusable blocks of configuration, grouping related resources.
- **Variables**: Parameters that configure resources dynamically.
- **State**: Tracks the current state of your infrastructure.
- **Idempotency**: Ensures operations produce the same outcome, regardless of how many times they are executed.
- **Declarative Syntax**: You specify the desired end-state, and Terraform handles the how.
- **Outputs**: Information about the infrastructure's provisioning.
- **Backend**: Stores the state file remotely for team collaboration.

### Terraform vs. Ansible:

- Terraform focuses on infrastructure provisioning.
- Ansible specializes in software configuration on existing infrastructure.

### Using Terraform (HCL - HashiCorp Configuration Language):

1. **Initialization**: Prepares your directory for Terraform operations.
   ```sh
   terraform init
   ```
2. **Validation**: Checks if the configuration is valid.
   ```sh
   terraform validate
   ```
3. **Formatting**: Adjusts formatting to the standard style.
   ```sh
   terraform fmt
   ```
4. **Planning**: Shows changes required to achieve the desired state.
   ```sh
   terraform plan
   ```
5. **Applying**: Applies the changes to reach the desired state.
   ```sh
   terraform apply
   ```
6. **Destruction**: Removes all resources defined in the Terraform configuration.
   ```sh
   terraform destroy
   ```

### Variables and Configuration:

- Define variables directly in `.tf` files or use `terraform.tfvars` for sensitive data.
- Apply configuration with `-var` or `-var-file` during the apply step.

### Getting Started:

#### Requirements:

- AWS Bucket for `.tfstate` storage (e.g., `deal-terraform-bucket`).
- Configure `aws.tfvars` with AWS config variables: `access_key`, `secret_key`, `token`, `region`.

#### Initialization:

```sh
terraform init -var-file=aws.tfvars
terraform init -var-file=gcloud.tfvars
```

#### Apply Configuration:

```sh
terraform apply -var-file=aws.tfvars --auto-approve
terraform apply -var-file=gcloud.tfvars --auto-approve
```

#### Clean Up:

```sh
terraform destroy -var-file=aws.tfvars --auto-approve
terraform destroy -var-file=gcloud.tfvars --auto-approve
```

#### Kubernetes Configuration:

- AWS EKS:
  ```sh
  aws eks update-kubeconfig --name <your-cluster-name>
  ```
- Google Cloud GKE:
  ```sh
  gcloud container clusters get-credentials deal-cluster --region us-central1 --project <project-name>
  ```

#### Code Formatting:

- Ensure consistent formatting:
  ```sh
  terraform fmt -recursive
  ```
