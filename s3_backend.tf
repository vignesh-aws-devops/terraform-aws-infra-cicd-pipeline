terraform {
  backend "s3" {
    bucket         = "s3-terraform-lock0102"  
    key            = "terraform.tfstate"     
    region         = "us-west-1"            
    dynamodb_table = "terraform-lock"        
    encrypt        = true              
  }
}
