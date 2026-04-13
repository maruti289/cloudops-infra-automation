import json

with open("terra-config/output.json") as f:
    data = json.load(f)

dev_ips   = data["dev_ips"]["value"]
stage_ips = data["stage_ips"]["value"]
prod_ips  = data["prod_ips"]["value"]

key_path = "~/.ssh/appKey"

lines = []

lines.append("[dev]")
for ip in dev_ips:
    lines.append(f"{ip} ansible_user=ubuntu ansible_ssh_private_key_file={key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'")

lines.append("\n[stage]")
for ip in stage_ips:
    lines.append(f"{ip} ansible_user=ubuntu ansible_ssh_private_key_file={key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'")

lines.append("\n[prod]")
for ip in prod_ips:
    lines.append(f"{ip} ansible_user=ubuntu ansible_ssh_private_key_file={key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'")

with open("ansible/inventory/hosts.ini", "w") as f:
    f.write("\n".join(lines))

print("✅ hosts.ini generated successfully!")