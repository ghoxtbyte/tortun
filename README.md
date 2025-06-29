# Tor Tunneling Bash Script for Linux

This script allows you to route all your system's traffic through the Tor network using `iptables`. It provides an interactive menu to easily toggle Tor tunneling on or off.

## ⚙️ Features

- Full system traffic routing via Tor (TCP ports 80, 443, 53 and UDP port 53)
- Transparent proxy setup using Tor's `TransPort` and `DNSPort`
- Simple interactive CLI
- Automatically adds/removes iptables rules
- Useful for anonymity, security testing, or bypassing censorship

---

## 🧰 Prerequisites

Make sure the following packages are installed:

- **tor**
- **iptables**
- **systemd** (for managing Tor as a service)

### 🔧 Install Requirements

```bash
sudo apt update
sudo apt install tor iptables -y
