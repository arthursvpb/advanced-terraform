# Terraform

Terraform automates the deployment of infrastructure through **Infrastructure as Code (IaC)**, creating and managing components across various providers via an abstraction layer.

`gcp_cicd_bootstrap`: Branch with complete Terraform Cloud CI/CD bootstrap config w/ Github actions and Google Cloud Build

### Key Concepts:

- **Terraform CLI**: The command-line interface tool that allows users to execute Terraform commands.
- **Providers**: Plugins for managing resources with cloud providers like AWS, Azure, Google Cloud, Docker, Kubernetes, etc.
- **Resources**: Individual infrastructure components, such as virtual machines, network interfaces, or managed databases.
- **Variables**: Parameters that dynamically configure resources, allowing for flexibility and reusability of configurations.
- **Inputs (Input Variables)**: Parameters defined by users to customize Terraform configurations, allowing users to input custom values without altering the main configuration.
- **Functions**: Built-in functions allow for basic transformations and computations within Terraform configuration.
- **Expressions**: Used to reference or compute values within a configuration, enabling dynamic configurations.
- **Modules**: Reusable blocks of configuration, grouping related resources, to simplify setup and management.
- **Outputs (Output Variables)**: Variables that provide information about the infrastructure, useful for referencing in other configurations or modules.
- **State**: Tracks the current state of your infrastructure, comparing it to the planned state to determine changes.
- **Remote State (Back-end)**: Stores the state file in a remote data store, facilitating team collaboration and state management.
- **Declarative Syntax**: You specify the desired end-state of the infrastructure, and Terraform figures out the steps to achieve it.
- **Idempotency**: Ensures operations produce the same outcome, regardless of how many times they are executed.
- **Terraform Plan**: Generates an execution plan, showing what Terraform will do when you apply your configuration.
- **Terraform Apply**: Executes the actions proposed in a Terraform plan to reach the desired state of the configuration.
- **Terraform Workspace**: Allows for the management of multiple distinct sets of infrastructure resources or environments from the same configuration.

### Using Terraform (HCL - HashiCorp Configuration Language):

1. **Initialization**: Prepares your directory for Terraform operations, including downloading required providers.
   ```sh
   terraform init
   ```
2. **Validation**: Checks if the configuration is syntactically valid and internally consistent.
   ```sh
   terraform validate
   ```
3. **Formatting**: Adjusts the configuration files to Terraform's standard formatting style.
   ```sh
   terraform fmt
   ```
4. **Planning**: Creates an execution plan, showing what Terraform intends to do to achieve the desired infrastructure state.
   ```sh
   terraform plan
   ```
5. **Applying**: Executes the actions proposed in the Terraform plan to reach the desired state.
   ```sh
   terraform apply
   ```
6. **Destruction**: Removes all resources defined in the Terraform configuration.
   ```sh
   terraform destroy
   ```

### Variables and Configuration:

- Variables can be defined directly in `.tf` files or externalized into `terraform.tfvars` files, especially for sensitive data.
- The configuration can be applied with the `-var` or `-var-file` flags during the apply step.

### Getting Started:

#### Requirements:

- AWS Bucket for `.tfstate` storage (e.g., `<name>-terraform-bucket`).
- Configure `aws.tfvars` or `gcloud.tfvars` with provider-specific config variables like `access_key`, `secret_key`, `region`.

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
  gcloud container clusters get-credentials <name>-cluster --region us-central1 --project <project-name>
  ```

#### Code Formatting:

- Ensure consistent formatting across all Terraform files.
  ```sh
  terraform fmt -recursive
  ```

### Google Cloud and Terraform: Tools and Setup

- **GCloud SDK**: Necessary for authenticating and configuring GCP for use with Terraform.
  - Authenticate with GCP:
    ```sh
    gcloud auth application-default login
    gcloud auth login `ACCOUNT`
    gcloud config set project <project-id>
    ```
  - Enable required GCP services:
    ```sh
    gcloud services enable iam.googleapis.com
    gcloud services enable cloudresourcemanager.googleapis.com
    ```

#### Deploying the Terraform Configuration

- Generating an execution plan and applying it:
  ```sh
  terraform plan -out=s1.tfplan
  terraform apply s1.tfplan
  ```
- For a visual representation of your Terraform plan:
  ```sh
  terraform graph // Use with webgraphviz.com
  ```
- Inspecting a plan:
  ```sh
  terraform show s1.tfplan
  terraform show -json s1.tfplan
  ```

#### Destroying Resources

- **Terraform Destroy**: To remove all resources managed by Terraform.
  ```sh
  terraform destroy
  ```
  Alternatively, resources can be deleted directly in the GCP console.

#### Input Variables

- Validate configurations with `terraform validate`.
- Variables can be set via:
  1. `terraform.tfvars` files.
  2. CLI using `-var` or `-var-file`.
  3. Environment variables.

#### Deploying a Remote State Configuration

- Configure backend for state management:
  ```sh
  terraform init -backend-config="bucket=remotestate_<project-id>"
  ```
