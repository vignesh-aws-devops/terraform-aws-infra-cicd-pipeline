# 🚀 Terraform CI/CD Pipeline on AWS

Automated the provisioning and management of AWS infrastructure using a fully integrated CI/CD pipeline powered by Terraform, AWS CodePipeline, and CodeBuild. This setup ensures faster, repeatable, and error-free deployments — all triggered by code commits on GitHub!

---

## ✅ Key Concepts Implemented

- ✅ **CodePipeline Integration** – Automatically triggers infrastructure deployments on GitHub commits  
- ✅ **AWS CodeBuild** – Executes Terraform commands in a managed build environment  
- ✅ **Remote State Management with S3** – Stores Terraform state securely and centrally  
- ✅ **State Locking with DynamoDB** – Prevents state conflicts in collaborative deployments  
- ✅ **Terraform Modules** – Reusable code structure for scalable and maintainable infra  
- ✅ **S3 + DynamoDB Backend** – Ensures consistent and reliable state management  
- ✅ **Secure IAM Roles** – Scoped permissions for build and pipeline execution  

---

## 🖼️ Architecture Overview

![Terraform CI/CD Architecture](terraform-aws-cicd%20pipeline.png)

---

## 🛠️ CI/CD Workflow & Commands Used

- 🟣 `terraform init` – Initializes backend and downloads providers  
- 🟣 `terraform validate` – Ensures the configuration syntax is correct  
- 🟣 `terraform plan` – Shows the proposed execution plan  
- 🟣 `terraform apply -auto-approve` – Provisions infrastructure automatically  
- 🟣 `terraform destroy` (manual trigger) – Cleanly tears down infrastructure post-validation  
- 🟣 `buildspec.yml` – Defines Terraform workflow inside CodeBuild  
- 🟣 **GitHub Webhooks** – Triggers pipeline on every push to the main branch  

---

## 📚 Takeaways & Learnings

- 💡 Automating infrastructure provisioning enhances speed and reliability  
- 💡 GitHub + CodePipeline creates a powerful DevOps workflow  
- 💡 S3 and DynamoDB backends bring state safety and collaboration readiness  
- 💡 Separation of environments (dev/prod) via Terraform workspaces or branches  
- 💡 IAM roles must follow least-privilege principles to ensure security  
- 💡 Writing clean Terraform modules = reusable + scalable cloud architecture  
- 💡 IaC + CI/CD = production-grade DevOps practice  

---

## 🟢 Let’s Connect!

If you’re passionate about DevOps or curious about AWS automation, let’s connect!  
I’d love to exchange ideas, discuss strategies, or collaborate on exciting projects.  
Drop your thoughts in the comments or reach out!

---

