#!/bin/bash
set -e

exec > /var/log/user-data.log 2>&1

echo "=== Creating agent-walkllc user ==="
id -u agent-walkllc &>/dev/null || useradd -m -G sudo -s /bin/bash agent-walkllc
echo "agent-walkllc ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/agent-walkllc
chmod 0440 /etc/sudoers.d/agent-walkllc

echo "=== Installing Ansible ==="
apt-get update
apt-get install -y software-properties-common
add-apt-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible

echo "=== Installing Tailscale ==="
curl -fsSL https://tailscale.com/install.sh | sh

echo "=== Joining tailnet ==="
tailscale up --authkey="${TAILSCALE_AUTH_KEY}" --hostname=oci-devbox --tags=tag:ci,tag:dev

echo "=== Waiting for Tailscale interface and locking SSH ==="
for i in $(seq 1 30); do
    TAILSCALE_IP=$(tailscale ip -4 2>/dev/null || true)
    if [ -n "$TAILSCALE_IP" ]; then
        echo "Tailscale IP: ${TAILSCALE_IP}"
        mkdir -p /etc/ssh/sshd_config.d/
        cat > /etc/ssh/sshd_config.d/tailscale-only.conf << SSHCONF
# Lock SSH to Tailscale interface only
ListenAddress ${TAILSCALE_IP}
SSHCONF
        systemctl restart sshd
        echo "SSHD locked to ${TAILSCALE_IP}"
        break
    fi
    echo "Waiting for Tailscale IP... (${i}/30)"
    sleep 2
done

echo "=== Copying SSH authorized_keys to agent-walkllc ==="
cp -r /home/ubuntu/.ssh /home/agent-walkllc/.ssh 2>/dev/null || true
chown -R agent-walkllc:agent-walkllc /home/agent-walkllc/.ssh 2>/dev/null || true

echo "=== Cloud-init complete ==="
