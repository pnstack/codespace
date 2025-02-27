#!/usr/bin/env bash
curl "https://releases.hashicorp.com/terraform/1.10.5/terraform_1.10.5_linux_arm64.zip" -o "terraform.zip" \

unzip terraform.zip  

mv terraform /usr/local/bin