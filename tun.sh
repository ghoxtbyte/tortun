#!/bin/bash

# Function to setup the system to route all traffic through Tor
connect_to_tor() {
    echo "Starting Tor and routing traffic..."

    # Start Tor service
    sudo systemctl start tor

    # Add iptables rules to route traffic through Tor (using TransPort and DNSPort)
    sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 9090
    sudo iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDIRECT --to-ports 9090
    sudo iptables -t nat -A OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 5353
    sudo iptables -t nat -A OUTPUT -p tcp --dport 53 -j REDIRECT --to-ports 5353

    echo "All traffic is now routed through Tor."
}

# Function to disconnect from Tor and remove iptables rules
disconnect_from_tor() {
    echo "Stopping Tor and removing iptables rules..."

    # Stop Tor service
    sudo systemctl stop tor

    # Remove iptables rules for Tor traffic redirection
    sudo iptables -t nat -D OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 9090
    sudo iptables -t nat -D OUTPUT -p tcp --dport 443 -j REDIRECT --to-ports 9090
    sudo iptables -t nat -D OUTPUT -p udp --dport 53 -j REDIRECT --to-ports 5353
    sudo iptables -t nat -D OUTPUT -p tcp --dport 53 -j REDIRECT --to-ports 5353

    echo "Tor tunnel disconnected. All traffic is now routed normally."
}

# Function to display options to the user
show_menu() {
    echo "===================================="
    echo "Tor Traffic Tunnel Management"
    echo "===================================="
    echo "1. Connect to Tor (Route all traffic through Tor)"
    echo "2. Disconnect from Tor (Remove Tor routing)"
    echo "3. Exit"
    echo "===================================="
}

# Main logic to handle user input and call respective functions
while true; do
    show_menu
    read -p "Select an option [1-3]: " option

    case $option in
        1)
            connect_to_tor
            ;;
        2)
            disconnect_from_tor
            ;;
        3)
            echo "Exiting script. No changes made."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select a valid option."
            ;;
    esac
    echo "===================================="
done

