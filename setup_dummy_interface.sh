#!/bin/bash

# This script automates the creation and configuration of a dummy network interface.
# It's useful for testing network applications, creating a persistent virtual IP,
# or for specific routing scenarios without needing physical hardware.

# --- Load the 'dummy' kernel module ---
# This step ensures the system has the necessary module to create dummy interfaces.
# 'modprobe' is used to add or remove modules from the Linux kernel.
# 'sudo' is required as loading kernel modules is a privileged operation.
sudo modprobe dummy

# --- Verify the 'dummy' module is loaded ---
# 'lsmod' lists all currently loaded kernel modules.
# 'grep dummy' filters the output to show only lines containing 'dummy',
# confirming that the module is active.
lsmod | grep dummy

# --- Create a new dummy network interface named 'dummy0' ---
# 'ip link add' is used to create new network devices.
# 'dummy0' is the chosen name for our virtual interface.
# 'type dummy' specifies that we are creating a dummy (virtual) interface.
sudo ip link add dummy0 type dummy

# --- Assign an IP address to the 'dummy0' interface ---
# 'ip addr add' assigns an IP address to a specified network device.
# '192.168.100.1/24' is the IP address (192.168.100.1) along with its subnet mask (/24).
# 'dev dummy0' specifies that this IP address should be assigned to our 'dummy0' interface.
sudo ip addr add 192.168.100.1/24 dev dummy0

# --- Bring the 'dummy0' interface up (activate it) ---
# 'ip link set' is used to change the state or properties of a network device.
# 'dummy0' is the target interface.
# 'up' changes the interface state to 'UP', making it active and ready for use.
sudo ip link set dummy0 up

# --- Display the configuration of the 'dummy0' interface ---
# 'ip addr show dummy0' provides detailed information about the 'dummy0' interface,
# including its link status, MAC address (a randomly generated one for dummy interfaces),
# assigned IPv4 and IPv6 addresses, and other network parameters.
# This command confirms that the interface has been successfully created, configured, and activated.
ip addr show dummy0
