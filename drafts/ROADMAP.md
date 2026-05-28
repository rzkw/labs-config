# Future Labs Roadmap

Rough ideas for expanding the lab infra and exploring new technologies.

## 1. Demo Playground VMs (Docker)
- **Objective**: Create a sandboxed environment for testing and demonstrating Docker image builders and container lifecycles.
- **Scope**:
    - Automated VM provisioning (Vagrant or Proxmox API).
    - CI/CD pipelines for building and pushing images to a local registry.
    - Integration testing for multi-stage Dockerfiles.

## 2. Networking Configurations
- **Objective**: Implement and document complex networking scenarios within the playground environment.
- **Scope**:
    - VLAN tagging and isolation.
    - Software-defined load balancing (HAProxy/Nginx).
    - Secure inter-site connectivity via Wireguard VPN.
    - Netplan automation through Ansible.

## 3. Fleet Monitoring (Grafana)
- **Objective**: Establish a centralized monitoring stack for real-time visibility into the health and performance of the VM fleet.
- **Scope**:
    - Metrics collection using Prometheus.
    - Dashboard visualization via Grafana.
    - Distributed telemetry using Node Exporter on all managed hosts.
    - Alerting configurations for critical system thresholds.
