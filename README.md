# Tor Tunneling Bash Script for Linux

This script allows you to route all your system's traffic through the Tor network using **iptables**. You can easily toggle the connection on or off with a simple menu system.

## Prerequisites

Before running the script, you'll need to install the required system dependencies. These include **Tor** (to create the tunnel) and **iptables** (to manage firewall rules).

### 1. Install Dependencies

You can install the necessary system dependencies using the following command:

```bash
sudo apt update
sudo apt install $(cat requirements.txt)
