# AWS Infrastructure Automation with Terraform & GitHub Actions

## Overview

This project demonstrates how to automate the deployment of cloud infrastructure on Amazon Web Services (AWS) using **Terraform** and **GitHub Actions**.

Instead of manually creating AWS resources through the AWS Console, the entire infrastructure is defined as code using **Terraform (Infrastructure as Code)**. The deployment process is then fully automated through a CI/CD pipeline built with GitHub Actions.

The project also includes PowerShell scripts to monitor and validate the deployed infrastructure.

---

# Objectives

The main objectives of this project are:

* Automate AWS infrastructure deployment
* Learn Infrastructure as Code (IaC)
* Build a CI/CD pipeline
* Apply cloud security best practices
* Deploy reproducible cloud environments
* Eliminate manual configuration

---

# Technologies Used

| Technology          | Purpose                        |
| ------------------- | ------------------------------ |
| AWS EC2             | Virtual Linux Server           |
| AWS S3              | Object Storage                 |
| AWS IAM             | Identity and Access Management |
| AWS Security Groups | Network Firewall               |
| Terraform           | Infrastructure as Code         |
| GitHub Actions      | CI/CD Pipeline                 |
| Git                 | Version Control                |
| PowerShell          | Infrastructure Monitoring      |

---

# Project Architecture

```text
Developer
     │
 git push
     │
     ▼
GitHub Repository
     │
     ▼
GitHub Actions
     │
     ▼
Terraform
     │
     ▼
AWS Infrastructure
     │
 ┌────┼───────────────┐
 │    │               │
 ▼    ▼               ▼
EC2  S3          Security Group
 │
 ▼
IAM Role
```

---

# Why Infrastructure as Code?

Traditional cloud deployment requires manually creating resources through the AWS Console.

This approach has several disadvantages:

* Time-consuming
* Error-prone
* Difficult to reproduce
* Impossible to version using Git

Terraform solves these problems by describing the entire infrastructure in code.

Benefits include:

* Reproducibility
* Version control
* Automation
* Collaboration
* Reduced human errors

---

# AWS Resources

## EC2 Instance

An Ubuntu virtual machine that acts as the application server.

Responsibilities:

* Host applications
* Execute services
* Allow SSH remote administration

---

## S3 Bucket

Cloud object storage used to store:

* Deployment artifacts
* Logs
* Backups
* Static files

---

## Security Group

Acts as the firewall protecting the EC2 instance.

Configured rules:

* Port 22 (SSH)
* Port 80 (HTTP)
* Port 443 (HTTPS)

Outgoing traffic is fully authorized.

---

## IAM Role

Provides secure access permissions to AWS resources.

The EC2 instance receives only the permissions it needs.

This follows the **Principle of Least Privilege**.

---

## SSH Key Pair

A public/private RSA key pair used for secure SSH authentication without passwords.

---

# Terraform Structure

```text
aws-infrastructure/

├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── .github/
│
└── workflows/
    └── deploy.yml
```

---

# Terraform Workflow

Terraform always follows the same lifecycle.

## 1. Initialize

```bash
terraform init
```

Downloads the AWS provider and initializes the project.

---

## 2. Plan

```bash
terraform plan
```

Compares the desired infrastructure with the current AWS infrastructure.

Shows what will be:

* Created
* Modified
* Deleted

No changes are made yet.

---

## 3. Apply

```bash
terraform apply
```

Creates the AWS infrastructure.

Terraform automatically provisions:

* EC2
* S3
* IAM
* Security Groups

---

## 4. Destroy

```bash
terraform destroy
```

Deletes every resource created by Terraform.

Useful to avoid unnecessary AWS costs.

---

# GitHub Actions Pipeline

The deployment process is fully automated.

Every push to the **main** branch triggers the pipeline.

Pipeline workflow:

```text
Developer
     │
 git push
     │
     ▼
GitHub Actions
     │
     ▼
Checkout Repository
     │
     ▼
Setup Terraform
     │
     ▼
Configure AWS Credentials
     │
     ▼
terraform init
     │
     ▼
terraform plan
     │
     ▼
terraform apply
     │
     ▼
Infrastructure Deployed
```

---

# GitHub Secrets

AWS credentials are never stored inside the source code.

GitHub Secrets securely stores:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY

The pipeline automatically injects these credentials during execution.

---

# Monitoring

PowerShell scripts were developed to validate the deployment.

Monitoring tasks include:

* Verify EC2 instance status
* Retrieve the public IP address
* List objects inside the S3 bucket
* Perform HTTP health checks

---

# Project Features

* Infrastructure as Code
* Automated AWS deployment
* CI/CD pipeline
* Cloud security best practices
* Infrastructure monitoring
* Reproducible deployments
* Version-controlled infrastructure

---

# Skills Developed

This project allowed me to strengthen my knowledge in:

* AWS Cloud
* Terraform
* Infrastructure as Code
* GitHub Actions
* CI/CD
* Linux Administration
* IAM Security
* Cloud Networking
* Automation
* DevOps

---

# Challenges Encountered

During the implementation of this project, several technical challenges were addressed:

* Terraform provider configuration
* AWS authentication
* IAM permission management
* Security Group configuration
* GitHub Actions pipeline debugging
* Secret management
* Resource dependency management

---

# Possible Improvements

Future enhancements include:

* Kubernetes deployment
* Auto Scaling Groups
* Application Load Balancer
* Amazon RDS integration
* Route53 DNS management
* CloudWatch monitoring
* Prometheus & Grafana
* Multi-environment deployment (Dev, Test, Production)
* Remote Terraform Backend using S3 and DynamoDB

---

# Learning Outcomes

Through this project I learned how to:

* Design cloud infrastructure using code
* Automate infrastructure deployment
* Build CI/CD pipelines
* Apply cloud security principles
* Manage AWS services efficiently
* Deploy reproducible environments

---

# Conclusion

This project demonstrates the practical implementation of modern DevOps and Cloud Engineering practices.

Using Terraform, GitHub Actions, and AWS services, the infrastructure deployment process becomes automated, reproducible, secure, and scalable.

The project reflects real-world Infrastructure as Code and CI/CD practices commonly used in enterprise cloud environments.
