---

```md
# Cisco Router Password Recovery Steps

Follow the steps below to recover/reset the enable password on a Cisco router.

## 1. Connect Console Cable
Connect your PC to the router using a console cable.

## 2. Power Off
Turn off the router.

## 3. Power On
Turn the router back on.

## 4. Press **CTRL + BREAK**
Send a break signal during boot to enter **ROMMON mode**.

---

## 5. ROMMON Commands to Bypass Startup Configuration

```

rommon 1> confreg 0x2142
rommon 2> reset

```

The router will now reboot **without loading the startup configuration**.

---

## 6. Load Configuration and Set New Password

```

Router> enable
Router# copy startup-config running-config
AIUB# config t
AIUB(config)# enable secret cisfo

```

Set the new password as needed.

```

AIUB(config)# exit
AIUB# copy running-config startup-config

```

---

## 7. Power Off
Turn off the router.

## 8. Power On
Turn the router back on.

## 9. Press **CTRL + BREAK**
Enter ROMMON mode again.

---

## 10. Restore Normal Boot Register

```

rommon 1> confreg 0x2102
rommon 2> reset

```

The router will now reboot normally using the saved configuration.

---

### Password recovery is complete.
```

---
