
# AnyDesk Autostart Troubleshooting (Kubuntu / KDE)

## Step 1 — Check if AnyDesk system service is running

First check the **systemd service**.

```bash
systemctl status anydesk
```

### Example (your case)

```text
○ anydesk.service - AnyDesk
Loaded: loaded (/etc/systemd/system/anydesk.service; disabled)
Active: inactive (dead)
```

### Interpretation

| Result           | Meaning                      |
| ---------------- | ---------------------------- |
| active (running) | service running              |
| inactive (dead)  | service not running          |
| enabled          | starts at boot               |
| disabled         | does not start automatically |

### Solution (if enabled)

Disable and stop it:

```bash
sudo systemctl disable --now anydesk.service
```

Optional (strong prevention):

```bash
sudo systemctl mask anydesk.service
```

---

# Step 2 — Check KDE User Autostart

KDE can launch apps automatically from **user autostart folder**.

Check:

```bash
ls ~/.config/autostart
```

### Possible output

Example:

```
anydesk.desktop
```

### Solution

Remove the autostart entry:

```bash
rm ~/.config/autostart/anydesk.desktop
```

### Your case

```
ls ~/.config/autostart
(no output)
```

Meaning:

✔ No user autostart entry exists.

---

# Step 3 — Check System-Wide Autostart (Very Common)

System autostart entries are stored in:

```
/etc/xdg/autostart
```

Check for AnyDesk:

```bash
ls /etc/xdg/autostart | grep -i anydesk
```

### Example output (your case)

```
anydesk_global_tray.desktop
```

This means **AnyDesk tray starts automatically at login**.

### Solution

Disable it by renaming:

```bash
sudo mv /etc/xdg/autostart/anydesk_global_tray.desktop \
/etc/xdg/autostart/anydesk_global_tray.desktop.disabled
```

Now KDE will **ignore it at login**.

---

# Step 4 — Verify No AnyDesk Process is Running

Check running processes.

```bash
ps aux | grep anydesk
```

### Example output (your case)

```
emaduzz+ 4055 grep --color=auto anydesk
```

Meaning:

✔ Only the search command appears
✔ No AnyDesk process is running

---

# Step 5 — KDE GUI Method (Optional)

You can also check via GUI.

Open:

```
System Settings
 → Startup and Shutdown
 → Autostart
```

Remove or disable **AnyDesk** if listed.

---

# Step 6 — Final Verification

Reboot system:

```bash
reboot
```

After login check:

```bash
ps aux | grep anydesk
```

Expected result:

```
(no AnyDesk process)
```

✔ AnyDesk will **not open automatically anymore**.

---

# Your Case Summary

| Check            | Result             |
| ---------------- | ------------------ |
| systemd service  | disabled           |
| user autostart   | none               |
| system autostart | found and disabled |
| running process  | none               |

✔ Problem solved.

---

# Quick Command Summary (Fast Fix)

```bash
sudo systemctl disable --now anydesk.service
ls ~/.config/autostart
ls /etc/xdg/autostart | grep -i anydesk
sudo mv /etc/xdg/autostart/anydesk_global_tray.desktop /etc/xdg/autostart/anydesk_global_tray.desktop.disabled
ps aux | grep anydesk
```

---

**Pro tip:**
Most Linux users think systemd is the reason, but **90% of the time the problem is `/etc/xdg/autostart` entries**.

---
