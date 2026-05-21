# Ansible Automation Guide

This directory contains the automation logic for the laboratory environment. It follows a standardized layout to ensure portability and clarity.

## Layout

- `files/`: Static configuration files and assets (e.g., `index.html`).
- `inventories/`: Host inventory files defining target environments.
- `playbooks/`: YAML playbooks for system configuration and application deployment.
- `templates/`: Jinja2 templates for dynamic configuration generation.

## Common Commands

Execute playbooks from the `ansible/` directory using the following command structure:

```bash
# Run a specific playbook
ansible-playbook -i inventories/hosts.ini playbooks/<playbook_name>.yml

# Example: Deploy Nginx
ansible-playbook -i inventories/hosts.ini playbooks/nginx-playbook.yml
```

## Prerequisites

- Ansible installed on the control machine.
- SSH access to the target hosts defined in `inventories/hosts.ini`.
- `vault.yaml` (not committed) containing sensitive credentials if required by playbooks.
