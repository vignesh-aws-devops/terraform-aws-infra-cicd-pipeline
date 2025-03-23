# 🚀 Two-Tier AWS Architecture Using Terraform 🚀

I’m excited to share that I’ve successfully built and deployed a two-tier architecture on AWS using **Terraform** for infrastructure automation! This setup includes a VPC with public and private subnets, an EC2 instance in each subnet, and a NAT Gateway to enable outbound internet access for private instances. Remote state management with S3 and DynamoDB ensures consistency and prevents conflicts in a collaborative environment.

---

## 🌟 **Key Concepts Implemented**  
✅ **Terraform Server** – A dedicated instance to execute Terraform commands  
✅ **Remote State Management** – Terraform state stored in Amazon S3 for consistency  
✅ **State Locking with DynamoDB** – Prevents conflicts in multi-user environments  
✅ **VPC with Public & Private Subnets** – Secure network segmentation for isolation  
✅ **Internet Gateway (IGW) & NAT Gateway** – Enabling secure internet access where required  
✅ **Public and Private EC2 Instances** – Public EC2 for external access and private EC2 for internal workloads  
✅ **Terraform Modules** – Modular approach for managing VPC and EC2 instances efficiently  

---

## 🖼️ **Architecture Overview**  
![AWS Two Tier Architecture](AWS%20Two%20Tier%20Architecture%20using%20Terraform.png)  


## 🏗️ **Terraform Workflow & Commands Used**  
🟣 **terraform init** – Initializes the working directory, downloads provider plugins, and configures the backend  
🟣 **terraform plan** – Generates and displays an execution plan before making changes  
🟣 **terraform apply** – Deploys the infrastructure as per the defined Terraform configuration  
🟣 **terraform destroy** – Tears down resources when no longer needed  
🟣 **Terraform Modules** – Breaking infrastructure into reusable components like separate modules for VPC and EC2  

---

## 🚀 **Takeaways & Learnings**  
💡 **Remote state management** is crucial when working in a team environment  
💡 **Terraform modules** help maintain clean and reusable infrastructure code  
💡 **Implementing security best practices** (private subnets, IAM roles, state locking) enhances cloud security  
💡 **Automating deployments** eliminates manual errors and ensures faster provisioning  
💡 **Understanding AWS networking** (VPC, IGW, NAT, and route tables) is key to building scalable architectures  
💡 **Infrastructure as Code (IaC)** is the future, making deployments seamless and repeatable  

---

## 🔗 **GitHub Repo**  
👉 [Terraform Two-Tier AWS Architecture](https://lnkd.in/g2aGEc_f)  

---

## 🟢 **Let’s Connect!**  
If you’re passionate about DevOps or curious about AWS automation, let’s connect! I’d love to exchange ideas, discuss strategies, or collaborate on exciting projects.  
