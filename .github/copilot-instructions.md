# AI Agent Instructions for labs-config

This repository contains configuration files and scripts for a Ubuntu Server 25 lab environment. Below are key instructions for AI agents working in this codebase.

## Project Architecture

### Core Components
- **SSH Configuration**: Secure remote access setup in `SSH/sshd_config`
  - Custom port (5678)
  - Root login disabled
  - Password authentication disabled
  - Public key authentication only
  - X11 forwarding and TCP forwarding disabled

- **Nginx Web Server**: Base configuration in `nginx/nginx.conf`
  - Uses www-data user
  - SSL configured for TLSv1.2/1.3 only
  - Includes modular configs from sites-enabled/

- **Backup System**: Two-tier backup strategy
  1. Local backup (`rsync-backup-script.sh`): 
     - Syncs home directory to mountpoint `/backup-sdb1`
     - Excludes `.cache/` directory
     - Generates detailed logs with timestamps
  2. Public backup (`public-backup.sh`):
     - Git-based backup system
     - Auto-commits with timestamp
     - Rebases on pull to maintain clean history

### Hardware Context
The server runs on an Acer Swift with limited resources:
- Intel Celeron N3450 (1.10GHz)
- 4GB RAM (non-upgradeable)
- 58GB SSD
- Intel HD Graphics (128MB)

## Developer Workflows

### Adding New Configurations
1. Place config files in appropriate subdirectories:
   - Web server configs → `nginx/`
   - SSH configs → `SSH/`
2. Use `public-backup.sh` to commit and push changes

### Running Backups
1. Local backup:
   ```bash
   # Ensure /backup-sdb1 is mounted
   ./rsync-backup-script.sh
   ```
2. Public backup:
   ```bash
   ./public-backup.sh
   ```

## Project Conventions

### File Organization
- Each service has its dedicated directory (nginx/, SSH/, etc.)
- Documentation and resources stored in dedicated directories:
  - `Links, reads and resources/`
  - `Vendor documentation/`
  - `Troubleshooting/`

### Security Practices
- Sensitive configurations use secure defaults
- All public-facing services have minimal exposure
- SSH access is restricted to public key authentication

### Backup Strategy
- Local backups preserve file timestamps and permissions
- Git-based public backups maintain configuration history
- Backup scripts include error handling and validation

When modifying configurations, always consider the limited hardware resources and maintain secure defaults.