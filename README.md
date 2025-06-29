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
````

---

## 🛠️ Tor Configuration (`/etc/tor/torrc`)

To enable transparent proxying, you must edit your Tor configuration file:

```bash
sudo nano /etc/tor/torrc
```

Add or uncomment the following lines **at the bottom** of the file:

```bash
## Enable Transparent Proxying
VirtualAddrNetworkIPv4 10.192.0.0/10
AutomapHostsOnResolve 1
TransPort 9090
DNSPort 5353
```

Then save the file and restart the Tor service:

```bash
sudo systemctl restart tor
```

---

## 🚀 Usage

1. Make the script executable:

```bash
chmod +x tor_tunnel.sh
```

2. Run the script:

```bash
./tor_tunnel.sh
```

3. Select an option:

```
1. Connect to Tor (Route all traffic through Tor)
2. Disconnect from Tor (Remove Tor routing)
3. Exit
```

---

## 📤 What It Does

When connecting:

* Starts the Tor service
* Adds `iptables` rules to redirect traffic:

  * TCP: ports 80 (HTTP), 443 (HTTPS), and 53 (DNS)
  * UDP: port 53 (DNS)

When disconnecting:

* Stops the Tor service
* Removes the iptables rules

---

## ❗ Important Notes

* Requires **sudo/root** to run (due to iptables and service commands)
* Existing iptables/NAT/firewall rules may conflict — use in isolated setups or test environments
* Use responsibly and legally. This script does not guarantee anonymity.
* This script **does not** persist iptables rules after reboot. For persistence, consider using `iptables-save` and `iptables-restore`.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
