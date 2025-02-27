#!/usr/bin/env bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" \

unzip awscliv2.zip  

./aws/install 

rm -rf awscliv2.zip aws