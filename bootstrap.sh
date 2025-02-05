#!/bin/bash

# Define S3 bucket name, DynamoDB table name, and AWS region
BUCKET_NAME="s3-terraform-lock0102"
DYNAMODB_TABLE="terraform-lock"
AWS_REGION="us-west-1"

echo "Checking if S3 bucket exists..."

# Check if the bucket exists
if aws s3api head-bucket --bucket "$BUCKET_NAME" 2>/dev/null; then
    echo "S3 bucket '$BUCKET_NAME' already exists. Skipping creation."
else
    echo "Creating S3 bucket: $BUCKET_NAME"
    
    # Handle the special case for us-east-1 (no LocationConstraint needed)
    if [ "$AWS_REGION" == "us-east-1" ]; then
        aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$AWS_REGION"
    else
        aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$AWS_REGION" \
            --create-bucket-configuration LocationConstraint="$AWS_REGION"
    fi

    echo "Enabling versioning on the S3 bucket..."
    aws s3api put-bucket-versioning --bucket "$BUCKET_NAME" --versioning-configuration Status=Enabled
    echo "Bucket created successfully."
fi

# Check if DynamoDB table exists
echo "Checking if DynamoDB table '$DYNAMODB_TABLE' exists..."
if aws dynamodb describe-table --table-name "$DYNAMODB_TABLE" 2>/dev/null; then
    echo "DynamoDB table '$DYNAMODB_TABLE' already exists. Skipping creation."
else
    echo "Creating DynamoDB table: $DYNAMODB_TABLE"
    
    # Create the DynamoDB table for state locking
    aws dynamodb create-table \
        --table-name "$DYNAMODB_TABLE" \
        --attribute-definitions AttributeName=LockID,AttributeType=S \
        --key-schema AttributeName=LockID,KeyType=HASH \
        --billing-mode PAY_PER_REQUEST \
        --region us-west-1
    
    echo "DynamoDB table '$DYNAMODB_TABLE' created successfully."
fi

# Check if Terraform is installed
if ! command -v terraform &> /dev/null
then
    echo "Terraform could not be found. Please install Terraform."
    exit 1
fi

# Initialize Terraform (Reconfigure if backend changed)
echo "Initializing Terraform..."

# You can choose to migrate or reconfigure the state based on your needs.
# Use the migrate-state if backend or state location changed
terraform init -reconfigure -backend-config="bucket=$BUCKET_NAME" -backend-config="region=$AWS_REGION" -backend-config="dynamodb_table=$DYNAMODB_TABLE"

echo "Terraform initialization completed successfully."
echo "Run 'terraform apply' manually to apply changes."