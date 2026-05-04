# AWS Infrastructure as Code: CloudFormation & Terraform Web Stack

## Project Overview
This repository demonstrates proficiency in **Infrastructure as Code (IaC)** by automating the deployment of a web environment on AWS using two industry-standard tools: **AWS CloudFormation** and **HashiCorp Terraform**. 

The goal is to provision a scalable and secure architecture including compute, storage, and identity management resources.

## Architecture
The project deploys the following AWS resources:
* **EC2 Instance**: Linux server (Amazon Linux 2) hosting an Apache Web Server.
* **S3 Bucket**: Private storage for application assets.
* **Security Group**: Firewall rules for SSH (22) and HTTP (80) access.
* **IAM Role & Instance Profile**: Secure cross-service permissions.

---

## Part 1: AWS CloudFormation
The CloudFormation implementation uses a declarative JSON template to manage resources as a single Stack.

### Key Concepts:
* **Parameters & Mappings**: Dynamic inputs and regional AMI lookups.
* **Intrinsic Functions**: Usage of `Ref`, `Fn::Sub`, and `Fn::GetAtt` for resource referencing.
* **Infrastructure Composer**: Visual design of the stack architecture.

---

## Part 2: Terraform Implementation
To demonstrate multi-cloud tool proficiency, the same infrastructure was modeled using HashiCorp Configuration Language (HCL).

### Key Features:
* **Provider Configuration**: AWS API integration.
* **Variable Management**: Modularized inputs for environment flexibility.
* **State Tracking**: Management of the `terraform.tfstate` file for resource lifecycle.

### Basic Workflow:
1. `terraform init` - Initialize environment.
2. `terraform plan` - Preview changes.
3. `terraform apply` - Deploy infrastructure.

---

## Verification & Cleanup
1. **Verification**: Access the `EC2PublicDNS` output in your browser to see the "Hello from CloudFormation Lab" page.
2. **Cleanup**: 
   * **CloudFormation**: Delete the stack via the AWS Console.
   * **Terraform**: Run `terraform destroy` in your terminal.
