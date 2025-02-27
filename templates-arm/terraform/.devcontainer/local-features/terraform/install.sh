#!/usr/bin/env bash

# Script to install Terraform on Linux
# Date: 2025-02-27

set -e

# Print colored output
print_message() {
  echo -e "\e[1;34m>> $1\e[0m"
}

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root or with sudo privileges."
  exit 1
fi

print_message "Installing dependencies..."
apt-get update
apt-get install -y curl unzip

# Get latest version
print_message "Determining latest Terraform version..."
LATEST_VERSION=$(curl -s https://releases.hashicorp.com/terraform/ | grep -Eo 'href="/terraform/[0-9]+\.[0-9]+\.[0-9]+"' | head -1 | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')

if [ -z "$LATEST_VERSION" ]; then
  print_message "Failed to determine the latest Terraform version. Defaulting to 1.8.4"
  LATEST_VERSION="1.8.4"
fi

print_message "Latest Terraform version: $LATEST_VERSION"

# Set architecture
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
  ARCH_TYPE="amd64"
elif [ "$ARCH" = "aarch64" ]; then
  ARCH_TYPE="arm64"
elif [ "$ARCH" = "armv7l" ]; then
  ARCH_TYPE="arm"
else
  # Default to amd64 for other architectures
  ARCH_TYPE="amd64"
fi

print_message "Detected architecture: $ARCH ($ARCH_TYPE)"

# Download Terraform
print_message "Downloading Terraform $LATEST_VERSION..."
TF_URL="https://releases.hashicorp.com/terraform/${LATEST_VERSION}/terraform_${LATEST_VERSION}_linux_${ARCH_TYPE}.zip"
TEMP_DIR=$(mktemp -d)
curl -s -o "${TEMP_DIR}/terraform.zip" "$TF_URL"

# Install Terraform
print_message "Installing Terraform..."
unzip -o "${TEMP_DIR}/terraform.zip" -d "${TEMP_DIR}"
mv "${TEMP_DIR}/terraform" /usr/local/bin/
chmod +x /usr/local/bin/terraform

# Clean up
rm -rf "${TEMP_DIR}"

# Verify installation
if terraform --version > /dev/null 2>&1; then
  print_message "Terraform $(terraform --version | head -n 1) installed successfully!"
  print_message "You can now use Terraform by running: terraform"
else
  print_message "Terraform installation failed."
  exit 1
fi