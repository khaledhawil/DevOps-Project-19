#!/bin/bash

set -e

echo "🚀 Starting Jenkins Infrastructure Deployment with Terraform + Ansible"

# Check if required tools are installed
command -v terraform >/dev/null 2>&1 || { echo "❌ Terraform is required but not installed. Aborting." >&2; exit 1; }
command -v ansible >/dev/null 2>&1 || { echo "❌ Ansible is required but not installed. Aborting." >&2; exit 1; }

# Environment selection
ENVIRONMENT=${1:-dev}
echo "📋 Using environment: $ENVIRONMENT"

# Navigate to terraform directory
cd "$(dirname "$0")/tf-aws-ec2"

echo "🔧 Installing Ansible collections..."
ansible-galaxy collection install -r ../ansible/requirements.yml

echo "🏗️  Initializing Terraform..."
terraform init

echo "📝 Planning Terraform changes..."
terraform plan -var-file="variables/${ENVIRONMENT}.tfvars"

echo "🚀 Applying Terraform configuration..."
terraform apply -var-file="variables/${ENVIRONMENT}.tfvars" -auto-approve

echo "✅ Deployment completed!"
echo "📊 Getting outputs..."
terraform output

echo ""
echo "🎉 Jenkins setup is complete!"
echo "📝 Access Jenkins at: http://$(terraform output -raw ec2_instance_ip):8080"
echo "📝 Access SonarQube at: http://$(terraform output -raw ec2_instance_ip):9000"
echo "🔑 Use the initial admin password displayed in the Ansible output above"
