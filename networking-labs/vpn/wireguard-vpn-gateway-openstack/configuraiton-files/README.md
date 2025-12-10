# WireGuard VPN Configuration Files Reference
## All Configuration Files for Quick Deployment

---

## Contents
1. [Server Configuration Files](#server-configuration-files)
2. [Client Configuration Files](#client-configuration-files)
3. [System Configuration Files](#system-configuration-files)
4. [Firewall Configuration Files](#firewall-configuration-files)
5. [Helper Scripts](#helper-scripts)

---

## Configuration Files Summary

### Server Files Checklist
- [ ] `/etc/wireguard/wg0.conf` - Main server configuration
- [ ] `/etc/sysctl.conf` - IP forwarding enabled
- [ ] `/etc/iptables/rules.v4` - Persistent firewall rules
- [ ] `/etc/systemd/system/wg-quick@.service.d/override.conf` - Service overrides (optional)

### Client Files Checklist
- [ ] `client-XXX.conf` - Client configuration files
- [ ] Different IP for each client (10.0.0.2, 10.0.0.3, etc.)
- [ ] Server public key same for all clients
- [ ] Server endpoint IP correct

### Helper Scripts Checklist (#helper-scripts)
- [ ] `/root/wireguard-scripts/generate-client-keys.sh`
- [ ] `/root/wireguard-scripts/create-client-config.sh`
- [ ] `/root/wireguard-scripts/add-client-to-server.sh`
- [ ] `/root/wireguard-scripts/remove-client-from-server.sh`
- [ ] `/root/wireguard-scripts/wireguard-status.sh`
- [ ] `/root/wireguard-scripts/backup-wireguard.sh`
- [ ] `/root/wireguard-scripts/restore-wireguard.sh`
- [ ] `/root/iptables-rules-wireguard.sh`
- [ ] `/root/iptables-flush.sh`

---

## Important Notes

### Security Reminders
1. **Never share private keys** - Keep them secure and confidential
2. **Replace placeholder keys** - Use actual generated keys in configurations
3. **Backup configurations** - Use the backup script regularly
4. **Restrict SSH access** - Consider IP whitelisting for SSH
5. **Monitor logs** - Check `/var/log/syslog` for issues

### Customization Required
Before using these configurations, you MUST:
1. Generate your own server keys
2. Replace `YOUR_SERVER_PUBLIC_KEY` with actual server public key
3. Replace `YOUR_SERVER_PRIVATE_KEY` with actual server private key
4. Replace `160.191.150.171` with your actual server public IP
5. Generate unique keys for each client
6. Assign unique IPs to each client (10.0.0.2, 10.0.0.3, etc.)
7. Update network interface names if different from `ens3`

### File Permissions
Always set correct permissions:
```bash
# Configuration files
chmod 600 /etc/wireguard/*.conf
chmod 600 /etc/wireguard/*.key

# Scripts
chmod +x /root/wireguard-scripts/*.sh
chmod +x /root/*.sh
```

---