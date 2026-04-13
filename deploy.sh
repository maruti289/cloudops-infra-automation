#!/bin/bash
set -e

echo "==> Step 1: Terraform Init & Apply"
cd terra-config
terraform init
terraform apply -auto-approve
terraform output -json > ../terra-config/output.json
cd ..

echo "==> Step 2: Generate Ansible Inventory"
python3 scripts/generate_inv.py

echo "==> Waiting 20s for EC2 instances to be ready..."
sleep 20

echo "==> Step 3: Run Ansible Playbook"
cd ansible
ansible-playbook -i inventory/hosts.ini playbook.yml
cd ..

echo "✅ Done! All instances configured."