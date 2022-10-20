# **terraform-gcp-project-october-2022**
For running IAC, the following are the prerequisites:

GCP Project: A GCP project where the assets need to be created. It's advisable to set up a project per environment (e.g. Dev Environment, UAT Environment, Production Environment etc.).

The deployment architecture expects two projects to setup an environment.

Host Project: This project hosts a default VPC and appropriate subnet. This project will host firewall rule(s).
Service Account For Terraform: A service account with approriate role to run IAC scripts against the project. Download private key for this service account.

IAC expects at least a service account.

Service Account for Compute Engine: A service account with appropriate role. This service account will be attached to the newly created compute engine.

Software: The following software is needed to run IAC scripts:

Terraform: The IAC tool. Terraform installation instructions can be found at https://learn.hashicorp.com/tutorials/terraform/install-cli
Terragrunt: The wrapper around Terraform that helps keep scripts DRY. Install Terragrunt using instructions at https://terragrunt.gruntwork.io/docs/getting-started/install/
Git: A SCM tool.

GOOGLE_APPLICATION_CREDENTIALS environment variable: Set GOOGLE_APPLICATION_CREDENTIALS environment variable to the downloaded private key path of the service account.

export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service/account/json/key
$env:GOOGLE_APPLICATION_CREDENTIALS= Resolve-Path 'creds.json'
Global project id: Replace this_project local variable to appropriate project id value in infrastructure-live/{some environment}/terragrunt.hcl file.

Backend: Create a cloud storage bucket to store Terraform state.

Enable Compute Engine API: Enable Compute Engine API by visiting https://console.cloud.google.com/marketplace/product/google/compute.googleapis.com, if it's not already enabled

Enable Cloud Resource Manager API: Enable Cloud Resource Manager API by visiting https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com, if it's not already enabled

IAM API: Enable IAM API by visiting https://console.developers.google.com/apis/api/iam.googleapis.com/overview, if it's not already enabled

# Running Terraform Scripts
See Execution Plan: terraform plan
Create Environment: terraform apply
Destroy Environment: terraform destroy
Print Environment Output: terraform output

