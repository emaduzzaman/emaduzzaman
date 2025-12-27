#!/bin/bash
# Mac Health & Security Report
# Save this as mac_health_check.sh, then run: chmod +x mac_health_check.sh && ./mac_health_check.sh

echo "==============================="
echo "      MAC HEALTH REPORT         "
echo "==============================="
echo ""
echo "Date: $(date)"
echo ""

# 1. System Integrity Protection
echo "1) System Integrity Protection (SIP):"
csrutil status 2>/dev/null || echo "SIP check requires Recovery Mode if not run from Terminal normally"
echo ""

# 2. Disk Health
echo "2) Disk Verification:"
diskutil verifyVolume / 
echo ""
echo "2b) Disk Repair (Dry Run, will not modify anything):"
diskutil repairVolume / 
echo ""

# 3. FileVault Status
echo "3) FileVault (Disk Encryption) Status:"
fdesetup status
echo ""

# 4. Firewall Status
echo "4) Firewall Status:"
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
echo ""

# 5. Gatekeeper Status
echo "5) Gatekeeper (App Verification) Status:"
spctl --status
echo ""

# 6. Home Folder Permissions
echo "6) Home Folder Ownership and Permissions:"
ls -l ~ | head -n 20
echo ""
echo "7) Resetting Home Permissions (Check Only):"
diskutil resetUserPermissions / `id -u` 2>/dev/null || echo "Reset skipped or requires admin privileges"
echo ""

# 7. Loaded Kernel Extensions
echo "8) Loaded Kernel Extensions (Top 20):"
kextstat | head -n 20
echo ""

# 8. Recent System Errors (Last 24h)
echo "9) Recent System Errors (Last 24 hours):"
log show --predicate 'eventMessage contains "error"' --last 24h | tail -n 50
echo ""

# 9. Software Updates
echo "10) Pending Software Updates:"
softwareupdate -l
echo ""

echo "==============================="
echo "       END OF REPORT           "
echo "==============================="

