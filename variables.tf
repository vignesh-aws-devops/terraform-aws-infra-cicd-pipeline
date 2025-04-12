# variables

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "192.168.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "192.168.2.0/24"
}



variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-08d4f6bbae664bd41"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
  default     = "MYEC2INSTANCE"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for Terraform backend"
  type        = string
  default     = "my-terraform-state-bucket"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for Terraform state locking"
  type        = string
  default     = "terraform-lock"
}
