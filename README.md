# AWS Infrastructure as Code: CloudFormation Web Stack

## Project Overview
[cite_start]This project demonstrates the use of **Infrastructure as Code (IaC)** to automate the deployment of a fully functional web environment on AWS[cite: 1, 2]. [cite_start]Using a single JSON template, this stack provisions compute, storage, networking, and security resources as a single unit called a Stack[cite: 4, 6].

## Architecture & Resources
The CloudFormation template automatically creates and manages the following AWS resources:
* [cite_start]**EC2 Instance**: A virtual Linux server (Amazon Linux 2)[cite: 4].
* [cite_start]**Apache Web Server**: Automatically installed and started via `UserData` scripts[cite: 34].
* [cite_start]**S3 Bucket**: A private object storage bucket for application files[cite: 4].
* [cite_start]**Security Group**: Configured firewall rules allowing inbound traffic on Port 22 (SSH) and Port 80 (HTTP)[cite: 4].
* [cite_start]**IAM Role & Instance Profile**: Secure permissions allowing the EC2 instance to interact with the S3 bucket[cite: 4].

## Key IaC Concepts Implemented
* [cite_start]**Templates**: JSON-formatted declarative files used to describe the desired state of resources[cite: 7].
* [cite_start]**Parameters**: Input values provided at runtime for reusable and unique resource naming[cite: 8].
* [cite_start]**Mappings**: Lookup tables to ensure regional compatibility by mapping specific AMI IDs to different AWS Regions[cite: 9, 41].
* [cite_start]**Intrinsic Functions**: Advanced template logic using functions like `Ref`, `Fn::Sub`, `Fn::GetAtt`, and `Fn::FindInMap` [cite: 11, 45-49].
* [cite_start]**Outputs**: Post-deployment metadata providing immediate access to the EC2 Public IP and DNS URL[cite: 10, 50].

## Deployment Instructions

### Prerequisites
1. [cite_start]An AWS Account (Free Tier eligible)[cite: 12].
2. [cite_start]An existing EC2 Key Pair created in your deployment region[cite: 13, 14].

### Steps to Deploy
1. [cite_start]Log in to the **AWS Management Console**[cite: 15].
2. [cite_start]Navigate to **CloudFormation** and click **Create stack** (with new resources)[cite: 16, 18, 19].
3. [cite_start]Upload the template file (found in the `templates/` folder of this repo)[cite: 20].
4. Fill in the **Stack Details**:
   - [cite_start]**Stack Name**: `cfn-lab-webstack`[cite: 21].
   - [cite_start]**StudentName**: Your identifier (lowercase)[cite: 21].
   - [cite_start]**KeyPairName**: Select your pre-created key pair[cite: 22].
5. [cite_start]On the **Review** page, ensure you check the box: *"I acknowledge that AWS CloudFormation might create IAM resources"*[cite: 26, 27].
6. [cite_start]Click **Submit**[cite: 27].

## Verification
[cite_start]Once the stack status is `CREATE_COMPLETE`[cite: 30]:
1. [cite_start]Go to the **Outputs** tab of the stack[cite: 31].
2. [cite_start]Click on the `EC2PublicDNS` link[cite: 32].
3. [cite_start]You should see a personalized welcome page: *"Hello from CloudFormation Lab!"*[cite: 33].

## Cleanup
[cite_start]To avoid ongoing AWS charges, delete the stack via the CloudFormation console[cite: 95, 96]. 
[cite_start]*Note: Ensure the S3 bucket is empty before deletion, or the process may fail[cite: 98, 99].*# aws-cloudformation-iaas-lab
Automated deployment of an AWS Web Stack using CloudFormation. Features EC2, S3, IAM, and Security Group orchestration via Infrastructure as Code (IaC).

---
## Bonus: Terraform Implementation
In addition to CloudFormation, this lab was also implemented using **Terraform** to demonstrate multi-tool proficiency in Infrastructure as Code.

### Key Terraform Features Used:
* **Providers**: Configured the AWS provider to interact with the cloud API.
* **Resources**: Defined identical infrastructure components (EC2, S3, SG, and IAM) using HCL (HashiCorp Configuration Language).
* **Variables**: Managed input values for environment customization.
* **State Management**: Understanding the `terraform.tfstate` file for tracking managed infrastructure.

### Deployment Commands:
1. `terraform init`: Initialize the working directory and download providers.
2. `terraform plan`: Preview the changes to be made.
3. `terraform apply`: Execute the deployment.
4. `terraform destroy`: Safely remove all provisioned resources.
